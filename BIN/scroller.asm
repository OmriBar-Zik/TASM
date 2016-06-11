IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
; text to the screen 
PlayerFailed			db 	'you failed', 10 dup (10), '$'
PlayerWon				db 	'you won!', 10 dup (10), '$'
; --------------------------
;
x 						dw 	120
y						dw 	0
color					dw 	7
; --------------------------
;the clock variable
Clock 					equ es:6Ch
ConsistentDelayCount	dw	2
; --------------------------
DotReader				db	?
; --------------------------
;player speed and movement
PlayerMovement			db 	1
SlowMovement			db	0
; --------------------------
;levels
level_1					dw 	7 dup (7), 55, 6 dup (7) , 55 , 6 dup (7), 55 ,5 dup (7), 55 ,16 dup (7), 55 , 6 dup (7), 55 , 18 dup (7) , 55 , 2 dup (7), 55 ,  6 dup (7), 55 , 11 dup (7), 55, 24 dup (7), 55 , 26 dup (7), 55 , 18 dup (7) , 55 , 44 dup (7) , 55 , 36 dup (7) , 55 ,25 dup (7) ,55 , 3 dup (7) , 55 , 8 dup (7) , 44 , 6 dup (7) , 55 , 13 dup (7) , 55 , 7 dup (7) , 55 , 7 dup (7) , 55 , 2 dup (7)	  
; --------------------------
CODESEG

;**********************
;**********************

proc ResetTimer
	mov [TimerStartTime_seconds], 0
	mov [TimerStartTime_minutes], 0			
	mov [TimerEndTime_seconds], 0 			
	mov [TimerEndTime_minutes], 0			
	mov [TimerFinelTime_seconds_Dozens], 0	
	mov [TimerFinelTime_seconds_Units], 0	
	mov [TimerFinelTime_minutes], 0			
	ret
endp ResetTimer

proc TestTimersMinutes
; --------------------------
	push ax
; --------------------------
	mov ah, [TimerEndTime_minutes]
	mov al, [TimerStartTime_minutes]
	sub ah, al
	mov [TimerFinelTime_minutes], ah
; --------------------------
	pop ax
; --------------------------
	ret
; --------------------------
endp TestTimersMinutes

;**********************
;**********************

proc TestTimersSeconds
; --------------------------
	push bx
; --------------------------
	mov bh, [TimerEndTime_seconds]
	mov bl, [TimerStartTime_seconds]
	sub bh, bl
	mov [TimerFinelTime_seconds_Units], bh
; --------------------------
	pop bx
; --------------------------
	ret
; --------------------------
endp TestTimersSeconds

;**********************
;**********************

proc RearrangeTimerNombers
; --------------------------
OverAMinutes:
	cmp [TimerFinelTime_seconds_Units], 60
	jl LessAMinutes
	sub [TimerFinelTime_seconds_Units], 60
	jmp OverAMinutes
LessAMinutes:
; --------------------------
	mov cx, 5
DozensLoop:
	cmp [TimerFinelTime_seconds_Units], 9
	jg AddDozens
	jmp DesplayNombers
AddDozens:
	inc [TimerFinelTime_seconds_Dozens]
	sub [TimerFinelTime_seconds_Units], 10
	loop DozensLoop
; --------------------------
DesplayNombers:
	add [TimerFinelTime_seconds_Units], 48
	add [TimerFinelTime_seconds_Dozens], 48
	add [TimerFinelTime_minutes], 48
; --------------------------
	ret
; --------------------------
endp RearrangeTimerNombers

;**********************
;**********************

proc StartTimer
; --------------------------
	push ax
	push cx
	push dx
; --------------------------
	mov ah, 2Ch
	int 21h
	mov [TimerStartTime_seconds], dh
	mov [TimerStartTime_minutes], cl
; --------------------------
	pop dx
	pop cx
	pop ax
; --------------------------
	ret
; --------------------------
endp StartTimer

;**********************
;**********************

proc EndTimer
; --------------------------
	push ax
	push cx
	push dx
; --------------------------
	mov ah, 2Ch
	int 21h
	mov [TimerEndTime_seconds], dh
	mov [TimerEndTime_minutes], cl
; --------------------------
	pop dx
	pop cx
	pop ax
; --------------------------
	ret
; --------------------------
endp EndTimer


proc PlayerTimeOutPut
; --------------------------
	push dx
	push si
	push ax
; --------------------------
	mov dx, offset OutPutPlayerTime
	mov ah, 9h
	int 21h
	mov dl, [TimerFinelTime_minutes]
	mov ah, 2
	int 21h	
	mov dl, ' '
	mov ah, 2
	int 21h
	mov dl, [TimerFinelTime_seconds_Dozens]
	mov ah, 2
	int 21h	
	mov dl, [TimerFinelTime_seconds_Units]
	mov ah, 2
	int 21h	

; --------------------------
	pop ax
	pop si
	pop dx
; --------------------------
	ret
; --------------------------
endp PlayerTimeOutPut

;**********************
;**********************

proc SoundEnd
; --------------------------
	push bx
	push dx
; --------------------------
	mov ah, 2Ch
	int 21h
	mov [TimerEndTime_seconds], dh
; --------------------------
	mov bh, [TimerEndTime_seconds]
	mov bl, [TimerStartTime_seconds]
	sub bh, bl
	mov ch, [SoundTime] 
	mov [TimerFinelTime_seconds_Units], bh
; --------------------------
	cmp [TimerFinelTime_seconds_Units], ch
	jl SoundStoped
	mov [StopSound], 1
SoundStoped:
; --------------------------
	pop dx
	pop bx
; --------------------------
	ret
; --------------------------
endp SoundEnd

;**********************
;**********************

proc PrintAX ; For debugging
; --------------------------
	push bx
	push cx
	push dx
	push ax
; --------------------------
	xor cx, cx
shrinkax:
	inc cx
	mov bx, 10
	xor dx, dx
	div bx
	push dx
	cmp al, 0
	je printloop
	jmp shrinkax
printloop:
	pop ax
	mov dl, '0'
	add dl, al
	mov ah, 2h
	int 21h
	loop printloop
; --------------------------
	pop ax
	pop dx
	pop cx
	pop bx
; --------------------------
	ret
; --------------------------
endp PrintAX

;**********************
;**********************

proc br ; Print line break
; --------------------------
	push dx
	push ax
; --------------------------
	mov dl, 10
	mov ah, 2
	int 21h
	mov dl, 13
	mov ah, 2
	int 21h
; --------------------------
	pop ax
	pop dx
; --------------------------
	ret
; --------------------------
endp br

;**********************
;**********************

proc read ; Read next sample
; --------------------------
	push bx
	push cx
	push dx
; --------------------------
	mov ah, 3Fh
	mov bx, [filehandle]
	mov cx, 1
	lea dx, [Buffer]
	int 21h
	jc errorcode
	mov al, [Buffer]
	xor ah, ah
	mov bx, 54
	mul bx
	;call PrintAX
	;mov ax, dx ; Result is in DX because we need to div by 65536 which is all of AX
	shr ax, 8
; --------------------------
	pop dx
	pop cx
	pop bx
; --------------------------
	ret
; --------------------------
endp read

;**********************
;**********************

proc StartSound
call StartTimer
mov [StopSound], 0
; --------------------------
	push ax
	push bx
	push cx
	push dx
; --------------------------
	mov ah, 3Dh
	xor al, al
	lea dx, [filename]
	int 21h
	mov [filehandle], ax
	call br
	mov al, 90h
	out 43h, al
	in al, 61h
	or al, 3
	out 61h, al
	cli
	mov ax, 0
totalloop:
	call read ; Read file
	out 42h, al ; Send data
	mov bx, ax
	mov cx, [SoundDelay]
portloop:
	loop portloop
	mov ax, bx
	out 42h, ax ; Send data
	mov cx, [SoundDelay]
rloop:
	loop rloop
	call read
	call SoundEnd
	cmp [StopSound], 1
	je errorcode
	jmp totalloop
	
errorcode:
	; Close
	sti
	mov al, 86h
	out 43h, al
	mov ah, 3Eh
	mov bx, [filehandle]
	int 21h
; --------------------------
	pop dx
	pop cx
	pop bx
	pop ax
; --------------------------
	ret
; --------------------------
endp StartSound

;**********************
;**********************

proc Test_Stop
; --------------------------
	push ax
; --------------------------
	mov ah, 1
	int 21h
; --------------------------
	pop ax
; --------------------------
	ret 
; --------------------------
endp Test_Stop

;**********************
;**********************

proc Test_OutPut
	mov dl, 'X'
	mov ah, 2
	int 21h
	ret 
endp Test_OutPut

;**********************
;**********************

proc Test_position
	mov [color], 5
	call PaintDot
	;mov [ConsistentDelayCount], 1
	;call ConsistentDelay
	mov [color], 40	
	ret
endp Test_position

;**********************
;**********************

proc Text_Mode
	mov ah, 0
	mov al, 2
	int 10h
	ret
endp Text_Mode

;**********************
;**********************

proc Graphic_Mode
	mov ax, 13h
	int 10h
	ret
endp Graphic_Mode

;**********************
;**********************

proc LevelObjects
; --------------------------
	push ax
; --------------------------
	mov ax, [si]
	mov [color], ax 
	add si, 2
; --------------------------
	pop ax
; --------------------------
	ret 
; --------------------------
endp LevelObjects

;**********************
;**********************

proc PaintDot
; Print dot at X , Y
; --------------------------
	push bx
	push cx
	push dx
	push ax
; --------------------------
	mov bh,0h
	mov cx,[x]
	mov dx,[y]
	mov al,[byte ptr color]
	mov ah,0ch
	int 10h
; --------------------------
	pop ax
	pop dx
	pop cx
	pop bx
; --------------------------
	ret
; --------------------------
endp PaintDot

;**********************
;**********************

proc ReadDot
;read dot at X , Y
; --------------------------
	push bx
	push cx
	push dx
	push ax
; --------------------------
	mov bh,0h
	mov cx,[x]
	mov dx,[y]
	mov ah,0Dh
	int 10h
	mov [DotReader] ,al
; --------------------------
	pop ax
	pop dx
	pop cx
	pop bx
; --------------------------
	ret 
; --------------------------
endp ReadDot

;**********************
;**********************

proc RectangleLeft5X5
; --------------------------
	push ax
	push bx
	push cx
	push dx
; --------------------------
    ;droing 5X5 Rectangle
    mov cx, 11
LooXLeft5X5:
    push cx
    mov cx, 11
LoopYLeft5X5:
    push cx
    call PaintDot
    inc [y]
    pop cx
    loop LoopYLeft5X5
    sub [y], 11
    pop cx
    dec [x]
    loop LooXLeft5X5
; --------------------------
	pop dx
	pop cx
	pop bx
	pop ax
; --------------------------
    ret
endp RectangleLeft5X5

;**********************
;**********************

proc LeyOutCreatorLevel_1
; --------------------------
	push ax
	push bx
	push cx
	push dx
; --------------------------
    ;setup to the level
	mov [x], 310
	mov [y], 9
	mov si, offset level_1
; --------------------------
    ;droing 18X18 Rectangle
    mov cx, 18
LoopXLeyOutCreator:
    push cx
    mov cx, 18
LoopYLeyOutCreator:
    push cx
	call LevelObjects
    call RectangleLeft5X5
    pop cx
    loop LoopYLeyOutCreator
    sub [x], 122
    add [y], 11
    pop cx
    loop LoopXLeyOutCreator
; --------------------------
	pop dx
	pop cx
	pop bx
	pop ax
; --------------------------
    ret
; --------------------------
endp LeyOutCreatorLevel_1

;**********************
;**********************

proc PlayerCreator
	mov [X], 218
	mov [Y], 114
	mov [color], 40
	call PlayerPainterUp
	ret
endp PlayerCreator

;**********************
;**********************

proc PlayerMoveDown
; --------------------------
	push ax
	push bx
	push cx
	push dx
; --------------------------
	mov [PlayerMovement], 1 
; --------------------------
LoopPlayerMoveDown:
; --------------------------
	call PlayerCheckerDown
	cmp [PlayerMovement], 0
	je PlayerMoveDownExit
; --------------------------
	mov [color], 7
	sub [y], 10
	call PlayerPainterDown
	sub [y], 9
	mov [color], 40
	call PlayerPainterDown
; --------------------------
	cmp [SlowMovement], 0
	je SlowMovementDown
	mov [ConsistentDelayCount], 1
	call ConsistentDelay
SlowMovementDown:
; --------------------------
	jmp LoopPlayerMoveDown
PlayerMoveDownExit:
; --------------------------
	pop dx
	pop cx
	pop bx
	pop ax
; --------------------------
	ret
; --------------------------
endp PlayerMoveDown

;**********************
;**********************

proc PlayerPainterDown
; --------------------------
	push ax
	push bx
	push cx
	push dx
; --------------------------
    add [y], 5
	sub [x], 6
; --------------------------
 
    mov cx, 10
loopYDown:
    push cx
    mov cx, 11
loopXDown:
    push cx
    call PaintDot
    inc [x]
    pop cx
    loop loopXDown
    sub [x], 11
    pop cx
    inc [y]
    loop loopYDown
; --------------------------
;to senter the starting point
    sub [y], 5
    add [x], 6
; --------------------------
	pop dx
	pop cx
	pop bx
	pop ax
; --------------------------
    ret
endp PlayerPainterDown 

;**********************
;**********************

proc PlayerCheckerDown
	add [y], 5
	call ReadDot
	call ColorProcessor
; --------------------------
	;testing position
	;call Test_position 
; --------------------------
	sub [y], 5
	ret
endp PlayerCheckerDown

;**********************
;**********************

proc PlayerMoveLeft
; --------------------------
	push ax
	push bx
	push cx
	push dx
; --------------------------
	mov [PlayerMovement], 1
; --------------------------
LoopPlayerMoveLeft:
; --------------------------
	call PlayerCheckerLeft
	cmp [PlayerMovement], 0
	je PlayerMoveLeftExit
; --------------------------
	mov [color], 7
	add [x], 11
	call PlayerPainterLeft
	add [x], 10
	mov [color], 40
	call PlayerPainterLeft
; --------------------------
	cmp [SlowMovement], 0
	je SlowMovementLeft
	mov [ConsistentDelayCount], 1
	call ConsistentDelay
SlowMovementLeft:
; --------------------------
	jmp LoopPlayerMoveLeft
PlayerMoveLeftExit:
; --------------------------
	pop dx
	pop cx
	pop bx
	pop ax
; --------------------------
	ret
; --------------------------
endp PlayerMoveLeft

;**********************
;**********************

proc PlayerPainterLeft
; --------------------------
	push ax
	push bx
	push cx
	push dx
; --------------------------
    ;good starting point
    sub [x], 7
    sub [y], 5
; --------------------------
	mov cx, 11
LoopXPlayerCreatorLeft:
    push cx
    mov cx, 10
LoopYPlayerCreatorLeft:
    push cx
    call PaintDot
    inc [y]
    pop cx
    loop LoopYPlayerCreatorLeft
    sub [y], 10
    pop cx
    dec [x]
    loop LoopXPlayerCreatorLeft
; --------------------------
    ;to senter the starting point
    add [x], 7
    add [y], 5
; --------------------------
	pop dx
	pop cx
	pop bx
	pop ax
; --------------------------
	ret
; --------------------------
endp PlayerPainterLeft

;**********************
;**********************

proc PlayerCheckerLeft
	sub [x], 7
	call ReadDot
	call ColorProcessor
; --------------------------
	;testing position
	;call Test_position 
; --------------------------
	add [x], 7
	ret

endp PlayerCheckerLeft

;**********************
;**********************

proc PlayerMoveUp
; --------------------------
	push ax
	push bx
	push cx
	push dx
; --------------------------
	mov [PlayerMovement], 1 
; --------------------------
LoopPlayerMoveUp:
; --------------------------
	call PlayerCheckerUp
	cmp [PlayerMovement], 0
	je PlayerMoveUpExit
; --------------------------
	mov [color], 7
	add [y], 10
	call PlayerPainterUp
	add [y], 9
	mov [color], 40
	call PlayerPainterUp
; --------------------------
	cmp [SlowMovement], 0
	je SlowMovementUp
	mov [ConsistentDelayCount], 1
	call ConsistentDelay
SlowMovementUp:
; --------------------------
	jmp LoopPlayerMoveUp
PlayerMoveUpExit:
; --------------------------
	pop dx
	pop cx
	pop bx
	pop ax
; --------------------------
	ret
; --------------------------
endp PlayerMoveUp

;**********************
;**********************

proc PlayerPainterUp
; --------------------------
	push ax
	push bx
	push cx
	push dx
; --------------------------
	sub [y], 6
	sub [x], 6
; --------------------------
    mov cx, 10
loopYUp:
    push cx
    mov cx, 11
loopXUp:
    push cx
    call PaintDot
    inc [x]
    pop cx
    loop loopXUp
    sub [x], 11
    pop cx
    dec [y]
    loop loopYUp
; --------------------------
	add [y], 6
	add [x], 6
; --------------------------
	pop dx
	pop cx
	pop bx
	pop ax
; --------------------------
    ret
; --------------------------
endp PlayerPainterUp

;**********************
;**********************

proc PlayerCheckerUp
	sub [y], 6
	call ReadDot
	call ColorProcessor
; --------------------------
	;testing position
	;call Test_position 
; --------------------------
	add [y], 6
	ret
endp PlayerCheckerUp

;**********************
;**********************

proc PlayerMoveRight
; --------------------------
	push ax
	push bx
	push cx
	push dx
; --------------------------
	mov [PlayerMovement], 1
; --------------------------
LoopPlayerMoveright:
; --------------------------
	call PlayerCheckerRight
	cmp [PlayerMovement], 0
	je PlayerMoveRightExit
; --------------------------
	mov [color], 7
	sub [x], 11
	call PlayerPainterRight
	sub [x], 10
	mov [color], 40
	call PlayerPainterRight
; --------------------------
	cmp [SlowMovement], 0
	je SlowMovementRight
	mov [ConsistentDelayCount], 1
	call ConsistentDelay
SlowMovementRight:
; --------------------------
; --------------------------
	jmp LoopPlayerMoveRight
PlayerMoveRightExit:
; --------------------------
	pop dx
	pop cx
	pop bx
	pop ax
; --------------------------
	ret
; --------------------------
endp PlayerMoveRight

;**********************
;**********************

proc PlayerPainterRight
; --------------------------
	push ax
	push bx
	push cx
	push dx
; --------------------------
	add [x], 5
	add [y], 4
; --------------------------
    mov cx, 11
LoopXRight:
    push cx
    mov cx, 10
LoopYRight:
    push cx
    call PaintDot
    dec [y]
    pop cx
    loop LoopYRight
    add [y], 10
    pop cx
    inc [x]
    loop LoopXRight
; --------------------------
	sub [x], 5
	sub [y], 4
; --------------------------
	pop dx
	pop cx
	pop bx
	pop ax
; --------------------------
endp PlayerPainterRight

;**********************
;**********************

proc PlayerCheckerRight
	add [x], 5
	;call Test_position
	call ReadDot
	call ColorProcessor
; --------------------------
	;testing position
	;call Test_position 
; --------------------------
	sub [x], 5
	ret
endp PlayerCheckerRight

;**********************
;**********************

proc ColorProcessor
; --------------------------
	cmp [DotReader], 0
	je PlayerFail
; --------------------------
	cmp [DotReader], 55
	je StopPlayer
; --------------------------
	cmp [DotReader], 44
	je PlayerWin
	ret 
; --------------------------
StopPlayer:
	mov [PlayerMovement], 0
	;Call Test_OutPut
	ret 
; --------------------------
PlayerFail:
	mov [PlayerMovement], 0
	call FailScreen
	ret 
; --------------------------
PlayerWin:
	mov [PlayerMovement], 0
	call WinScreen
	ret
; --------------------------
endp ColorProcessor 

;**********************
;**********************

proc ConsistentDelay
; --------------------------
	push ax
	push bx
	push cx
	push dx
	push es
; --------------------------
	mov ax, 40h
	mov es, ax
	mov ax, [Clock]
; --------------------------
	FirstTick:
	cmp ax, [Clock]
	je FirstTick
; --------------------------
	; count 0.5 sec
	mov cx, [ConsistentDelayCount] ;DelayCuntX0.055sec = ~0.5sec
	DelayLoop:
	mov ax, [Clock]
; --------------------------
	Tick:
	cmp ax, [Clock]
	je Tick
; --------------------------
	loop DelayLoop
; --------------------------
	pop es
	pop dx
	pop cx
	pop bx
	pop ax
; --------------------------
	ret
; --------------------------
endp ConsistentDelay


proc UnconsistentDelay
	; push cx
	; push bx
	; mov cx, 0FFFFh
; LoopUnconsistentDelay:

	; loop LoopUnconsistentDelay
	
	; pop bx 
	; pop cx
	
	
endp UnconsistentDelay

;**********************
;**********************

proc FailScreen
	push dx
	push ax
	call Text_Mode
	call Graphic_Mode
	mov dx, offset PlayerFailed
	mov ah, 9h
	int 21h
	pop ax
	pop dx
	ret
endp FailScreen

;**********************
;**********************

proc WinScreen
	push dx
	push ax
	call Text_Mode
	call Graphic_Mode
	mov dx, offset PlayerWon
	mov ah, 9h
	int 21h
	pop ax
	pop dx
	ret
endp WinScreen

;**********************
;**********************

proc RestartLevel
	call Text_Mode
	call Graphic_Mode
	call LeyOutCreatorLevel_1
	call PlayerCreator
	ret
endp RestartLevel

proc key_test
	; --------------------------
	cmp ah, 1Eh ;left
	jne right
	; --------------------------
	call PlayerMoveLeft
	; --------------------------
	ret
	; --------------------------
right:
	cmp ah, 20h ;right
	jne up
	; --------------------------
	call PlayerMoveRight
	; --------------------------
	ret
	; --------------------------
up:
	cmp ah, 11h ;up
	jne down
	; --------------------------
	call PlayerMoveUp
	; --------------------------
	ret
	; --------------------------
down:
	cmp ah, 1Fh ;down
	jne restart
	; --------------------------
	call PlayerMoveDown
	; --------------------------
	ret
	; --------------------------
restart:
	cmp ah, 13h ;restart
	jne escp
	; --------------------------
	call RestartLevel
	; --------------------------
	ret
	; --------------------------
escp:
	cmp ah, 1h 	;esc
	jne Shift_R
	; --------------------------
	;retern to text mode
	mov ah, 0
	mov al, 2
	int 10h
	; --------------------------
	mov ah, 4Ch
	int 21h	
	; --------------------------
Shift_R:
	cmp ah, 21h
	jne ToExit
	; --------------------------
	call Test_OutPut
	not [SlowMovement]
	; --------------------------
	ret
	; --------------------------
ToExit:
	; --------------------------
	ret
	; --------------------------
endp key_test

;**********************
;**********************
start:
	mov ax, @data
	mov ds, ax
; --------------------------
; Graphic mode
	mov ax, 13h   
	int 10h
; --------------------------
	call LeyOutCreatorLevel_1
	call PlayerCreator
; --------------------------
	WaitForData:
	mov ah, 1
	int 16h
	jz WaitForData	
	call key_test 
	mov ah, 0 ; there is a key in the buffer, read it and clear the buffer
	int 16h 
	jmp WaitForData
; --------------------------
exit:
	mov ax, 4c00h
	int 21h
END start