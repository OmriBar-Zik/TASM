IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
PlayerFailed			db 	'you failed', 10 dup (10), '$'
PlayerWon				db 	'you won!', 10 dup (10), '$'
; --------------------------
x 						dw 	120
y						dw 	0
color					dw 	7
; --------------------------
Clock 					equ es:6Ch
ConsistentDelayCount	dw	2
; --------------------------
DotReader				db	?
; --------------------------
PlayerMovement			db 	1
SlowMovement			db	0
; --------------------------
;level_1 				dw 	324 dup (7)
level_1					dw 	7 dup (7), 55, 6 dup (7) , 55 , 6 dup (7), 55 ,5 dup (7), 55 ,16 dup (7), 55 , 6 dup (7), 55 , 18 dup (7) , 55 , 2 dup (7), 55 ,  6 dup (7), 55 , 11 dup (7), 55, 24 dup (7), 55 , 26 dup (7), 55 , 18 dup (7) , 55 , 44 dup (7) , 55 , 36 dup (7) , 55 ,25 dup (7) ,55 , 3 dup (7) , 55 , 8 dup (7) , 44 , 6 dup (7) , 55 , 13 dup (7) , 55 , 7 dup (7) , 55 , 7 dup (7) , 55 , 2 dup (7)	  
; --------------------------
CODESEG

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
	mov [ConsistentDelayCount], 1
	call ConsistentDelay
	mov [color], 40	
endp Test_position

;**********************
;**********************

proc Text_Mode
	mov ah, 0
	mov al, 2
	int 10h
endp Text_Mode

;**********************
;**********************

proc Graphic_Mode
	mov ax, 13h
	int 10h
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
    ;droing 5X5 Rectangle
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
	jne space
	; --------------------------
	;retern to text mode
	mov ah, 0
	mov al, 2
	int 10h
	; --------------------------
	mov ah, 4Ch
	int 21h	
	; --------------------------
space:
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