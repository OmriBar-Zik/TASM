JUMPS
IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
;timer variables
TimerStartTime_seconds			db	?
TimerStartTime_minutes			db	?
TimerEndTime_seconds			db	?
TimerEndTime_minutes			db	?
TimerFinelTime_seconds_Dozens	db	?
TimerFinelTime_seconds_Units	db	?
TimerFinelTime_minutes			db	?
; --------------------------
Letter_A						dw	0,44,44,0,44,0,0,44,44,44,44,44,44,0,0,44,44,0,0,44 ;make a loop of 4X5
Letter_B						dw	0,44,44,44,44,0,0,44,0,44,44,44,44,0,0,44,0,44,44,44 ;make a loop of 4X5
Letter_C						dw	44,44,44,0,0,0,0,44,0,0,0,44,0,0,0,44,44,44,44,0 ;make a loop of 4X5
Letter_D						dw	0,44,44,44,44,0,0,44,44,0,0,44,44,0,0,44,0,44,44,44 ;make a loop of 4X5
Letter_E						dw	44,44,44,44,0,0,0,44,44,44,44,44,0,0,0,44,44,44,44,44 ;make a loop of 4X5
Letter_F						dw	44,44,44,44,0,0,0,44,44,44,44,44,0,0,0,44,0,0,0,44 ;make a loop of 4X5
Letter_G						dw	44,44,44,0,0,0,0,44,44,44,0,44,44,0,0,44,44,44,44,0 ;make a loop of 4X5
Letter_H						dw	44,0,0,44,44,0,0,44,44,44,44,44,44,0,0,44,44,0,0,44 ;make a loop of 4X5
Letter_I						dw	44,44,44,44,44 ;make a loop of 1X5
Letter_J						dw	44,0,0,0,44,0,0,0,44,0,0,0,44,0,0,44,0,44,44,0 ;make a loop of 4X5
Letter_K						dw	44,0,0,44,0,44,0,44,0,0,44,44,0,44,0,44,44,0,0,44 ;make a loop of 4X5
Letter_L						dw	0,0,0,44,0,0,0,44,0,0,0,44,0,0,0,44,44,44,44,44 ;make a loop of 4X5
Letter_M						dw	44,0,0,0,44,44,44,0,44,44,44,0,44,0,44,44,0,0,0,44,44,0,0,0,44 ;make a loop of 5X5
Letter_N						dw	44,0,0,44,44,0,44,44,44,44,0,44,44,0,0,44,44,0,0,44 ;make a loop of 4X5
Letter_O						dw	0,44,44,0,44,0,0,44,44,0,0,44,44,0,0,44,0,44,44,0 ;make a loop of 4X5
Letter_P						dw	0,44,44,44,44,0,0,44,0,44,44,44,0,0,0,44,0,0,0,44 ;make a loop of 4X5
Letter_Q						dw	0,44,44,0,44,0,0,44,44,0,0,44,0,44,0,44,44,0,44,0 ;make a loop of 4X5
Letter_R						dw	0,44,44,44,44,0,0,44,0,44,44,44,0,44,0,44,44,0,0,44 ;make a loop of 4X5
Letter_S						dw	44,44,44,0,0,0,0,44,0,44,44,0,44,0,0,0,0,44,44,44 ;make a loop of 4X5
Letter_T						dw	44,44,44,44,44,0,0,44,0,0,0,0,44,0,0,0,0,44,0,0,0,0,44,0,0 ;make a loop of 5X5
Letter_U						dw	44,0,0,44,44,0,0,44,44,0,0,44,44,0,0,44,0,44,44,0 ;make a loop of 4X5
Letter_V						dw	44,0,0,0,44,44,0,0,0,44,0,44,0,44,0,0,44,0,44,0,0,0,44,0,0 ;make a loop of 5X5
Letter_W						dw	44,0,44,0,44,44,0,44,0,44,44,0,44,0,44,0,44,0,44,0,0,44,0,44,0 ;make a loop of 5X5
Letter_X						dw	44,0,0,44,44,0,0,44,0,44,44,0,44,0,0,44,44,0,0,44 ;make a loop of 4X5
Letter_Y						dw	44,0,0,44,44,0,0,44,44,44,44,44,44,0,0,0,0,44,44,44 ;make a loop of 4X5
Letter_Z						dw	44,44,44,44,44,0,0,0,0,44,44,0,0,0,0,44,44,44,44,44 ;make a loop of 4X5
; --------------------------
Namber_0						dw	0,44,44,0,44,0,0,44,44,0,0,44,44,0,0,44,0,44,44,0 ;make a loop of 4X5
Namber_1						dw	0,0,44,0,0,0,44,44,0,0,44,0,0,0,44,0,0,44,44,44 ;make a loop of 4X5
Namber_2						dw	0,44,44,0,44,0,0,44,0,44,0,0,0,0,44,0,44,44,44,44 ;make a loop of 4X5
Namber_3						dw	0,44,44,44,44,0,0,0,0,44,44,0,44,0,0,0,0,44,44,44 ;make a loop of 4X5
Namber_4						dw	44,44,0,0,44,0,44,0,44,0,0,44,44,44,44,44,44,0,0,0 ;make a loop of 4X5
Namber_5						dw	44,44,44,44,0,0,0,44,44,44,44,44,44,0,0,0,0,44,44,44 ;make a loop of 4X5
Namber_6						dw	0,44,44,0,0,0,0,44,0,44,44,44,44,0,0,44,0,44,44,0 ;make a loop of 4X5
Namber_7						dw	44,44,44,44,44,0,0,0,0,44,0,0,0,44,0,0,0,44,0,0 ;make a loop of 4X5
Namber_8						dw	0,44,44,0,44,0,0,44,0,44,44,0,44,0,0,44,0,44,44,0 ;make a loop of 4X5
Namber_9						dw	0,44,44,0,44,0,0,44,44,44,44,0,44,0,0,0,0,44,44,0 ;make a loop of 4X5
; --------------------------
BlueLeftArrow					dw	0,55,0,0,0,55,55,0,55,55,55,55,0,55,55,0,0,55,0,0 ;make a loop of 4X5
BlueRightArrow					dw	0,0,55,0,0,55,55,0,55,55,55,55,0,55,55,0,0,0,55,0 ;make a loop of 4X5
GrayLeftArrow					dw	0,7,0,0,0,7,7,0,7,7,7,7,0,7,7,0,0,7,0,0 ;make a loop of 4X5
GrayRightArrow					dw	0,0,7,0,0,7,7,0,7,7,7,7,0,7,7,0,0,0,7,0 ;make a loop of 4X5
restart							dw	28 dup (0), 55, 17 dup (0), 55,55, 11 dup (0), 8 dup (55), 8 dup (0),55, 55, 5 dup (0), 55,55,8 dup (0), 55,7 dup (0) ,55, 9 dup (0),55, 16 dup (0),  55, 17 dup (0), 55 , 17 dup (0), 55 , 17 dup (0), 55 , 13 dup (0) , 55, 3 dup (0), 55 ,13 dup (0) , 55 , 3 dup (0), 55 ,13 dup (0) , 55 , 4 dup (0) , 55, 11 dup (0), 55, 5 dup (0),55  , 11 dup (0), 55 , 6 dup (0), 55,55,7 dup (0), 55,55,9 dup (0), 7 dup (55), 28 dup (0)           
; --------------------------
GamePlaySelector				db	0
ScreenSelector					db 	0
ChooseRectangleMovementMain		db	0
ChooseRectangleMovementSettings	db	0
ChooseRectangleMovementLevelSelctor	db 1
ChooseRectangleMovementWin		db	0
; --------------------------
; sound Ports
pit 							db 	43h
pit2							db 	42h
; --------------------------
;sound time menegers
SoundDelay 						dw 	210
StopSound						db 	0
SoundTime						db 	2
; --------------------------
;sound settings
SoundOnOff						db	1
filename 						db 	"you_won.wav", 0 
filehandle 						dw 	0
Buffer 							db 	0
; **************************
;text to the screen 		
PlayerFailed					db 	'you failed', 10 dup (10), '$'
PlayerWon						db 	'you won!',13, 10, '$'
ErrorMsg 						db	"Error.$"
OutPutPlayerTime				db	5 dup (10), 15 dup (' '),'your time',10,10,18 dup(' ') ,'$'
Win_Navigators					db	14 dup (10), 'level selctor',4 dup (' '),'restart',5 dup (' '),'next level','$'
; --------------------------
;menu screen
PlayButten						db	10 dup (10), 2 dup (9), 1 dup (' '), 'play',10,13,'$'
settingsButten					db	2 dup (10), 1 dup (9), 7 dup (' '), 'settings',10,13,'$'
CreditsButten					db	2 dup (10), 1 dup (9), 8 dup (' '), 'Credit',10,13,'$'
ExitButten						db	2 dup (10), 1 dup (9), 9 dup (' '), 'exit',10,13,'$'
; --------------------------
;settings screen			
PlayerSpeedButten				db	6 dup (10),1 dup (' '), 'player speed',10,13,'$'
PlayerColorButten				db	2 dup (10),1 dup (' '), 'player color',10,13,'$'
SoundButten						db	2 dup (10),1 dup (' '), 'sound',10,13,'$'
RainbowModeButten				db	2 dup (10),1 dup (' '), 'rainbow mode',10,13,'$'
hintsButten						db	2 dup (10),1 dup (' '), 'hints',10,13,'$'
BackButten						db	2 dup (10),1 dup (' '), 'back',10,13,'$'
; **************************
;Graphics variables
x 								dw 	120
y								dw 	0
color							dw 	7
; --------------------------
;delay variables
Clock 							equ es:6Ch
ConsistentDelayCount			dw	2
; --------------------------
;player's tests
DotReader						db	?
; --------------------------
;player color
PlayerColor						db	0
playerColorSelected				db	0
RainbowMode						db	0
; --------------------------
;player speed and movement
PlayerMovement					db 	1
SlowMovement					db	0
PlayerSpeed						db	9
; --------------------------
;the levels array
OpenLevel						dw	9,1,0,0,0,0,0,0,0,0,0
level_1							dw 	1,7 dup (7), 55, 6 dup (7) , 55 , 6 dup (7), 55 ,5 dup (7), 55 ,16 dup (7), 55 , 6 dup (7), 55 , 18 dup (7) , 55 , 2 dup (7), 55 ,  6 dup (7), 55 , 11 dup (7), 55, 24 dup (7), 55 , 26 dup (7), 55 , 18 dup (7) , 55 , 44 dup (7) , 55 , 36 dup (7) , 55 ,25 dup (7) ,55 , 3 dup (7) , 55 , 8 dup (7) , 44 , 6 dup (7) , 55 , 13 dup (7) , 55 , 7 dup (7) , 55 , 7 dup (7) , 55 , 2 dup (7)	  
level_2							dw	0,33 dup (7), 44 , 14 dup (7),55, 6 dup (7), 55 , 26 dup (7), 55, 10 dup (7), 55 , 22 dup (7), 55, 14 dup (7), 55, 38 dup (7), 55, 20 dup (7), 55,	12 dup (7), 55, 24 dup (7),55,8 dup (7),55,47 dup (7), 55, 3 dup (7) , 55 ,33 dup (7)	
level_3							dw	0,26 dup (7), 55,14 dup (7), 55 , 10 dup (7), 55 , 62 dup (7),55, 4 dup (7), 55, 23 dup (7) ,55, 19 dup (7), 55 , 39 dup (7), 55 , 14 dup (7), 55 , 7 dup (7),55,22 dup (7), 55, 5 dup (7) , 55 , 19 dup (7), 55, 8 dup (7), 55, 17 dup (7), 44 , 7 dup (7), 55	, 2 dup (7), 55, 9 dup (7)		
level_4							dw	0,7
level_5							dw	0,7
level_6							dw	0,7
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
; ---------------------------
call StartTimer
mov [StopSound], 0
; ---------------------------
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

proc RectangleLeft4X4
; --------------------------
    ;droing 3X3 Rectangle
    mov cx, 4
LooXLeft4X4:
    push cx
    mov cx, 4
LoopYLeft4X4:
    push cx
    call PaintDot
    dec [y]
    pop cx
    loop LoopYLeft4X4
    add [y], 4
    pop cx
    dec [x]
    loop LooXLeft4X4
; --------------------------
    ret
; --------------------------
endp RectangleLeft4X4

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

proc LeyOutCreatorLevel
; --------------------------
	push ax
	push bx
	push cx
	push dx
; --------------------------
    ;setup to the level
	mov [x], 310
	mov [y], 9
	add si, 2
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
endp LeyOutCreatorLevel

proc IconsCreator
; --------------------------
	push ax
	push bx
	push cx
	push dx
; --------------------------
    ;setup to the level
; --------------------------
    ;droing 18X18 Rectangle
    mov cx, 18
LoopXIconsCreator:
    push cx
    mov cx, 18
LoopYIconsCreator:
    push cx
	call LevelObjects
    call RectangleLeft4X4
    pop cx
    loop LoopYIconsCreator
    add [x], 72
    add [y], 4
    pop cx
    loop LoopXIconsCreator
; --------------------------
	pop dx
	pop cx
	pop bx
	pop ax
; --------------------------
    ret
; --------------------------
endp IconsCreator

;**********************
;**********************

proc PlayerCreator
	mov [X], 218
	mov [Y], 114
	call ColorUpdate
	call PlayerPainterUp
	ret
endp PlayerCreator

;**********************
;**********************
proc RainbowModeOn
	cmp [RainbowMode], 1
	jne RainbowModeOffDown
	call ChangePlayerColor
RainbowModeOffDown:
	ret
endp RainbowModeOn


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
	call RainbowModeOn
	call ColorUpdate
	call PlayerPainterDown
; --------------------------
	call DeterminePlyerSpeed
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
	call RainbowModeOn
	call ColorUpdate
	call PlayerPainterLeft
; --------------------------
	call DeterminePlyerSpeed
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
	call RainbowModeOn
	call ColorUpdate
	call PlayerPainterUp
; --------------------------
	call DeterminePlyerSpeed
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
	call RainbowModeOn
	call ColorUpdate
	call PlayerPainterRight
; --------------------------
	call DeterminePlyerSpeed
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
	mov cx, [ConsistentDelayCount] ;DelayCunt X 0.055sec
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

;**********************
;**********************

proc RectangleUp3X3
; --------------------------
    ;good starting point
    sub [y], 2
    sub [x], 1
; --------------------------
    ;droing 3X3 Rectangle
    mov cx, 3
loopYUp3X3:
    push cx
    mov cx, 3
loopXUp3X3:
    push cx
    call PaintDot
    inc [x]
    pop cx
    loop loopXUp3X3
    sub [x], 3
    pop cx
    dec [y]
    loop loopYUp3X3
; --------------------------
    ;to senter the starting point
    add [y], 2
    add [x], 1
; --------------------------
    ret
endp RectangleUp3X3

;***************************
;***************************

proc RectangleDown3X3
; --------------------------
    ;good starting point
    add [y], 2
    sub [x], 1
; --------------------------
    ;droing 3X3 Rectangle
    mov cx, 3
loopYDown3X3:
    push cx
    mov cx, 3
loopXDown3X3:
    push cx
    call PaintDot
    inc [x]
    pop cx
    loop loopXDown3X3
    sub [x], 3
    pop cx
    inc [y]
    loop loopYDown3X3
; --------------------------
;to senter the starting point
    sub [y], 2
    add [x], 1
; --------------------------
    ret
endp RectangleDown3X3

;***************************
;***************************

proc RectangleLeft3X3
; --------------------------
    ;good starting point
    sub [x], 2
    add [y], 1
; --------------------------
    ;droing 3X3 Rectangle
    mov cx, 3
LooXLeft3X3:
    push cx
    mov cx, 3
LoopYLeft3X3:
    push cx
    call PaintDot
    dec [y]
    pop cx
    loop LoopYLeft3X3
    add [y], 3
    pop cx
    dec [x]
    loop LooXLeft3X3
; --------------------------
    ;to senter the starting point
    add [x], 2
    sub [y], 1
; --------------------------
    ret
endp RectangleLeft3X3

;***************************
;***************************

proc RectangleRight3X3
; --------------------------
    ;good starting point
    add [x], 2
    add [y], 1
; --------------------------
    ;droing 3X3 Rectangle
    mov cx, 3
LooXRight3X3:
    push cx
    mov cx, 3
LoopYRight3X3:
    push cx
    call PaintDot
    dec [y]
    pop cx
    loop LoopYRight3X3
    add [y], 3
    pop cx
    inc [x]
    loop LooXRight3X3
; --------------------------
    ;to senter the startung point
    sub [x], 2
    sub [y], 1
; --------------------------
    ret
endp RectangleRight3X3

;**********************
;**********************

proc Menu_Key_Test
; --------------------------
    ;Detect down
    cmp ah, 1Fh
    jne Menu_up
    call ChooseRectangleMovementMenuUp
    ret
; --------------------------
Menu_up:
    ;Detect up
    cmp ah, 11h
    jne Menu_Enter
    call ChooseRectangleMovementMenuDown
    ret
; --------------------------
Menu_Enter:
    ;Detect enter
    cmp ah, 1Ch
    jne Menu_escp
    call MenuEnterCheker
; --------------------------
    ret
; --------------------------
Menu_escp:
; --------------------------
    ret
; --------------------------
endp Menu_Key_Test

;**********************
;**********************

proc StartLevel
	call Text_Mode
	call Graphic_Mode
	call LeyOutCreatorLevel
	call PlayerCreator
	call StartTimer
	ret
endp StartLevel

proc LevelSelecterOpeningScreen
	mov [y], 10
	mov [x], 35
	mov si, offset Letter_l
	call LetterCreator
; --------------------------
	add [x], 22
	sub [y], 20
	mov si, offset Letter_e
	call LetterCreator
; --------------------------
	add [x], 27
	sub [y], 20
	mov si, offset Letter_v
	call LetterCreator5X5
; --------------------------
	add [x], 22
	sub [y], 20
	mov si, offset Letter_e
	call LetterCreator
; --------------------------
	add [x], 22
	sub [y], 20
	mov si, offset Letter_l
	call LetterCreator
; --------------------------
	add [x], 32
	sub [y], 20
	mov si, offset Letter_s
	call LetterCreator
; --------------------------
	add [x], 22
	sub [y], 20
	mov si, offset Letter_e
	call LetterCreator
; --------------------------
	add [x], 22
	sub [y], 20
	mov si, offset Letter_l
	call LetterCreator
; --------------------------
	add [x], 22
	sub [y], 20
	mov si, offset Letter_e
	call LetterCreator
; --------------------------
	add [x], 22
	sub [y], 20
	mov si, offset Letter_c
	call LetterCreator
; --------------------------
	add [x], 27
	sub [y], 20
	mov si, offset Letter_t
	call LetterCreator5X5
; --------------------------
	add [x], 22
	sub [y], 20
	mov si, offset Letter_r
	call LetterCreator
; --------------------------
	ret
endp LevelSelecterOpeningScreen


proc SettingsOpeningScreen
; --------------------------
	mov dx, offset PlayerSpeedButten
	mov ah, 9h
	int 21h
; --------------------------
	mov dx, offset PlayerColorButten
	mov ah, 9h
	int 21h
; --------------------------
	mov dx, offset SoundButten
	mov ah, 9h
	int 21h
; --------------------------
	mov dx, offset RainbowModeButten
	mov ah, 9h
	int 21h
; --------------------------
	mov dx, offset BackButten
	mov ah, 9h
	int 21h
; --------------------------
	mov [y], 10
	mov [x], 85
	mov si, offset Letter_s
	call LetterCreator
; --------------------------
	add [x], 22
	sub [y], 20
	mov si, offset Letter_e
	call LetterCreator
; --------------------------
	add [x], 27
	sub [y], 20
	mov si, offset Letter_t
	call LetterCreator5X5
; --------------------------
	add [x], 27
	sub [y], 20
	mov si, offset Letter_t
	call LetterCreator5X5
; --------------------------
	add [x], 10
	sub [y], 20
	mov si, offset Letter_i
	call Letter_I_Creator
; --------------------------
	add [x], 22
	sub [y], 20
	mov si, offset Letter_n
	call LetterCreator
; --------------------------
	add [x], 22
	sub [y], 20
	mov si, offset Letter_g
	call LetterCreator
; --------------------------
	add [x], 22
	sub [y], 20
	mov si, offset Letter_s
	call LetterCreator
; --------------------------
	mov [x], 302
	mov [y], 47
	call ChangeDisplayPlayerSpeed
; --------------------------
	add [y], 10
	sub [x], 2
	call ColorUpdate
	call RectangleLeft5X5
; --------------------------
	add [y], 22
	add [x], 5
	call DisplaySound
; --------------------------
	add [y], 10
	sub [x], 25
	call DisplayRainbowMode
; --------------------------
	ret
; --------------------------
endp SettingsOpeningScreen



proc DisplaOff3X3
; --------------------------
	mov si, offset Letter_o
	call NamberCreator
; --------------------------
	add [x], 15
	sub [y], 15
	mov si, offset Letter_f
	call NamberCreator
; --------------------------
	add [x], 15
	sub [y], 15
	mov si, offset Letter_f
	call NamberCreator
; --------------------------
	ret
; --------------------------
endp DisplaOff3X3


proc DisplaOn3X3
; --------------------------
	mov si, offset Letter_o
	call NamberCreator
; --------------------------
	add [x], 15
	sub [y], 15
	mov si, offset Letter_n
	call NamberCreator
; --------------------------
	ret
; --------------------------
endp DisplaOn3X3


proc StartSettingsScreen 
	call Text_Mode
	call Graphic_Mode
	call SettingsOpeningScreen
	call ChooseRectangleSettings
	ret
endp StartSettingsScreen

proc StartLevelSelecter
	call Text_Mode
	call Graphic_Mode
	call LevelSelecterOpeningScreen
	call ChooseRectangleLevelSelctor
	ret
endp StartLevelSelecter

proc MenuEnterCheker
; --------------------------
	cmp [ChooseRectangleMovementMain], 0
	jne SettingsScreenSelect
; --------------------------
	;call StartLevel
	call StartLevelSelecter
	mov [ScreenSelector], 1
; --------------------------
	ret
; --------------------------
SettingsScreenSelect:
; --------------------------
	cmp [ChooseRectangleMovementMain], 1
	jne CreditScreenSelect
; --------------------------
	call StartSettingsScreen
	mov [ScreenSelector], 2
; --------------------------
	ret
; --------------------------
CreditScreenSelect:
; --------------------------
	cmp [ChooseRectangleMovementMain], 2
	jne ExitScreenSelect
; --------------------------
	;call RollCredits
ExitScreenSelect:
; --------------------------
	cmp [ChooseRectangleMovementMain], 3
	jne errorScreenSelect
; --------------------------
	;retern to text mode
	mov ah, 0
	mov al, 2
	int 10h
; --------------------------
	;exit code
	mov ah, 4Ch
	int 21h	 
; --------------------------
errorScreenSelect:
	ret
endp MenuEnterCheker



proc DeterminePlyerSpeed
mov [ConsistentDelayCount], 1
; --------------------------
PlayerSpeed_0:
	cmp [PlayerSpeed] , 0
	jne PlayerSpeed_1
; --------------------------
	call ConsistentDelay
	ret
; --------------------------
PlayerSpeed_1:
	cmp [PlayerSpeed] , 1
	jne PlayerSpeed_2
; --------------------------
	cmp [SlowMovement], 1
	jne ResetPlayerSpeed_1
	mov [SlowMovement], 0
	call ConsistentDelay
ResetPlayerSpeed_1:
	inc [SlowMovement]
	ret
; --------------------------
PlayerSpeed_2:	
	cmp [PlayerSpeed] , 2
	jne PlayerSpeed_3
; --------------------------
	cmp [SlowMovement], 2
	jne ResetPlayerSpeed_2
	mov [SlowMovement], 0
	call ConsistentDelay
ResetPlayerSpeed_2:
	inc [SlowMovement]
	ret
; --------------------------
PlayerSpeed_3:	
	cmp [PlayerSpeed] , 3
	jne PlayerSpeed_4
; --------------------------
	cmp [SlowMovement], 3
	jne ResetPlayerSpeed_3
	mov [SlowMovement], 0
	call ConsistentDelay
ResetPlayerSpeed_3:
	inc [SlowMovement]
	ret	
; --------------------------
PlayerSpeed_4:	
	cmp [PlayerSpeed] , 4
	jne PlayerSpeed_5
; --------------------------
	cmp [SlowMovement], 4
	jne ResetPlayerSpeed_4
	mov [SlowMovement], 0
	call ConsistentDelay
ResetPlayerSpeed_4:
	inc [SlowMovement]
	ret
; --------------------------
PlayerSpeed_5:
	cmp [PlayerSpeed] , 5
	jne PlayerSpeed_6
; --------------------------
	cmp [SlowMovement], 5
	jne ResetPlayerSpeed_5
	mov [SlowMovement], 0
	call ConsistentDelay
ResetPlayerSpeed_5:
	inc [SlowMovement]
	ret
; --------------------------
PlayerSpeed_6:
	cmp [PlayerSpeed] , 6
	jne PlayerSpeed_7
; --------------------------
	cmp [SlowMovement], 6
	jne ResetPlayerSpeed_6
	mov [SlowMovement], 0
	call ConsistentDelay
ResetPlayerSpeed_6:
	inc [SlowMovement]
	ret	
; --------------------------
PlayerSpeed_7:
	cmp [PlayerSpeed] , 7
	jne PlayerSpeed_8
; --------------------------
	cmp [SlowMovement], 7
	jne ResetPlayerSpeed_7
	mov [SlowMovement], 0
	call ConsistentDelay
ResetPlayerSpeed_7:
	inc [SlowMovement]	
	ret
; --------------------------
PlayerSpeed_8:
	cmp [PlayerSpeed] , 8
	jne PlayerSpeed_9
; --------------------------
	cmp [SlowMovement], 8
	jne ResetPlayerSpeed_8
	mov [SlowMovement], 0
	call ConsistentDelay
ResetPlayerSpeed_8:
	inc [SlowMovement]
	ret
PlayerSpeed_9:
	ret
endp DeterminePlyerSpeed

proc ChangePlayerSpeed
	cmp [PlayerSpeed], 9
	je MaxPlayerSpeed
	inc [PlayerSpeed]
	ret
MaxPlayerSpeed:
	mov [PlayerSpeed], 0
	ret
endp ChangePlayerSpeed



proc ChangeDisplayPlayerSpeed
; --------------------------
	cmp [PlayerSpeed], 0
	jne ChangePlayerSpeed_1
; --------------------------
	mov [x], 302
	mov [y], 47
	mov si, offset Namber_0
	call NamberCreator
	ret
; --------------------------
ChangePlayerSpeed_1:
	cmp [PlayerSpeed], 1
	jne ChangePlayerSpeed_2
; --------------------------
	mov [x], 302
	mov [y], 47
	mov si, offset Namber_1
	call NamberCreator
	ret
; --------------------------
ChangePlayerSpeed_2:
	cmp [PlayerSpeed], 2
	jne ChangePlayerSpeed_3
; --------------------------
	mov [x], 302
	mov [y], 47
	mov si, offset Namber_2
	call NamberCreator
	ret
; --------------------------
ChangePlayerSpeed_3:
	cmp [PlayerSpeed], 3
	jne ChangePlayerSpeed_4
; --------------------------
	mov [x], 302
	mov [y], 47
	mov si, offset Namber_3
	call NamberCreator
	ret
; --------------------------
ChangePlayerSpeed_4:
	cmp [PlayerSpeed], 4
	jne ChangePlayerSpeed_5
; --------------------------
	mov [x], 302
	mov [y], 47
	mov si, offset Namber_4
	call NamberCreator
	ret
; --------------------------
ChangePlayerSpeed_5:
	cmp [PlayerSpeed], 5
	jne ChangePlayerSpeed_6
; --------------------------
	mov [x], 302
	mov [y], 47
	mov si, offset Namber_5
	call NamberCreator
	ret
; --------------------------
ChangePlayerSpeed_6:
	cmp [PlayerSpeed], 6
	jne ChangePlayerSpeed_7
; --------------------------
	mov [x], 302
	mov [y], 47
	mov si, offset Namber_6
	call NamberCreator
	ret
; --------------------------
ChangePlayerSpeed_7:
	cmp [PlayerSpeed], 7
	jne ChangePlayerSpeed_8
; --------------------------
	mov [x], 302
	mov [y], 47
	mov si, offset Namber_7
	call NamberCreator
	ret
; --------------------------
ChangePlayerSpeed_8:
	cmp [PlayerSpeed], 8
	jne ChangePlayerSpeed_9
; --------------------------
	mov [x], 302
	mov [y], 47
	mov si, offset Namber_8
	call NamberCreator
	ret
; --------------------------
ChangePlayerSpeed_9:
	cmp [PlayerSpeed], 9
	jne ChangePlayerSpeedExit
; --------------------------
	mov [x], 302
	mov [y], 47
	mov si, offset Namber_9
	call NamberCreator
	ret
; --------------------------
ChangePlayerSpeedExit:
	ret
endp ChangeDisplayPlayerSpeed

; **************************	
; **************************

proc ChangePlayerColor
	cmp [PlayerColor], 5
	je MaxPlayerColor
	inc [PlayerColor]
	ret
MaxPlayerColor:
	mov [PlayerColor], 0
	ret
endp ChangePlayerColor
	
; **************************
; **************************
	
proc ColorUpdate
ChangeColorUpdate_0:
	cmp [PlayerColor], 0
	jne ChangeColorUpdate_1
; --------------------------
	mov [color], 40
; --------------------------
	ret
; --------------------------
ChangeColorUpdate_1:
	cmp [PlayerColor], 1
	jne ChangeColorUpdate_2
; --------------------------
	mov [color], 52
; --------------------------
	ret
; --------------------------
ChangeColorUpdate_2:
	cmp [PlayerColor], 2
	jne ChangeColorUpdate_3
; --------------------------
	mov [color], 48
; --------------------------
	ret
; --------------------------
ChangeColorUpdate_3:
	cmp [PlayerColor], 3
	jne ChangeColorUpdate_4
; --------------------------
	mov [color], 15
; --------------------------
	ret
; --------------------------
ChangeColorUpdate_4:
	cmp [PlayerColor], 4
	jne ChangeColorUpdate_5
; --------------------------
	mov [color], 36
; --------------------------
	ret	
; --------------------------
ChangeColorUpdate_5:
	cmp [PlayerColor], 5
	jne ChangeColorUpdateMax
; --------------------------
	mov [color], 9
; --------------------------
	ret	
; --------------------------
ChangeColorUpdateMax:
; --------------------------
	ret
; --------------------------
endp ColorUpdate

; **************************
; **************************

proc ChangeDisplayPlayerColor
	mov [x], 300
	mov [y], 72
	call ColorUpdate
	call RectangleLeft5X5
	ret
endp ChangeDisplayPlayerColor
	
proc SettingsEnterCheker
; --------------------------
playerSpeedSelect:
	cmp [ChooseRectangleMovementSettings], 0
	jne playerColorSelect
; --------------------------
	call ChangePlayerSpeed
	call ChangeDisplayPlayerSpeed
; --------------------------
	ret
; --------------------------
playerColorSelect:
; --------------------------
	cmp [ChooseRectangleMovementSettings], 1
	jne soundSelect
; --------------------------
	call ChangePlayerColor
	call ChangeDisplayPlayerColor
; --------------------------
	ret
; --------------------------
SoundSelect:
; --------------------------
	cmp [ChooseRectangleMovementSettings], 2
	jne RainbowModeSelect
; --------------------------
	call checkSoundSettings
	call Displaysound
RainbowModeSelect:
; --------------------------
	cmp [ChooseRectangleMovementSettings], 3
	jne BackSelect
; --------------------------
	call checkRainbowMode
	call DisplayRainbowMode
; --------------------------
BackSelect:
	cmp [ChooseRectangleMovementSettings], 4
	jne SettingsErrorScreenSelect
; --------------------------
	call MenuScreen
; --------------------------
	ret
; --------------------------
SettingsErrorScreenSelect:
; --------------------------
	ret
; --------------------------
endp SettingsEnterCheker


proc checkSoundSettings
	cmp [SoundOnOff], 1
	jne SoundGoOffLine
	mov [SoundOnOff], 0
	ret
SoundGoOffLine:
	mov [SoundOnOff], 1
	ret
endp checkSoundSettings

proc DisplaySound
	cmp [SoundOnOff], 1
	jne SoundOffLine
	mov [x], 312
	mov [y], 92
	call ClearOnOff
	mov [x], 294
	mov [y], 93
	call DisplaOn3X3
	ret
SoundOffLine:
	mov [x], 312
	mov [y], 92
	call ClearOnOff
	mov [x], 284
	mov [y], 93
	call DisplaOff3X3
	ret
endp DisplaySound

proc checkRainbowMode
	cmp [RainbowMode], 1
	jne RainbowModeGoOffLine
	mov [RainbowMode], 0
	ret
RainbowModeGoOffLine:
	mov [RainbowMode], 1
	ret
endp checkRainbowMode 

;**********************
;**********************

proc ClearOnOff
; --------------------------
	push ax
	push bx
	push cx
	push dx
; --------------------------
    ;droing 5X5 Rectangle
    mov cx, 50
LoopXRainbowMode:
    push cx
    mov cx, 17
LoopYRainbowMode:
    push cx
	mov [color], 0
    call PaintDot
    inc [y]
    pop cx
    loop LoopYRainbowMode
    sub [y], 17
    pop cx
    dec [x]
    loop LoopXRainbowMode
; --------------------------
	pop dx
	pop cx
	pop bx
	pop ax
; --------------------------
    ret
endp ClearOnOff

;**********************
;**********************

proc DisplayRainbowMode
	cmp [RainbowMode], 1
	jne RainbowModeOffLine
	mov [x], 312
	mov [y], 118
	call ClearOnOff
	mov [x], 294
	mov [y], 119
	call DisplaOn3X3
	ret
RainbowModeOffLine:
	mov [x], 312
	mov [y], 118
	call ClearOnOff
	mov [x], 284
	mov [y], 119
	call DisplaOff3X3
	ret
endp DisplayRainbowMode

;**********************
;**********************

proc ChooseRectangleWin
; --------------------------
	cmp [ChooseRectangleMovementWin], 0
	jne WinOption2
; --------------------------
	mov [color], 44
	call Win_Option1
	mov [color], 0
	call Win_Option2
	call Win_Option3
; --------------------------
    ret
; --------------------------
WinOption2:
	cmp [ChooseRectangleMovementWin], 1
	jne WinOption3
; --------------------------
	mov [color], 0
	call Win_Option1
	mov [color], 44
	call Win_Option2
	mov [color], 0
	call Win_Option3
; --------------------------
	ret
; --------------------------
WinOption3:
	cmp [ChooseRectangleMovementWin], 2
	jne WinOptionMax
; --------------------------
	mov [color], 0
	call Win_Option1
	call Win_Option2
	mov [color], 44
	call Win_Option3
; --------------------------
	ret
; --------------------------
WinOptionMax:
; --------------------------
	ret
; --------------------------
endp ChooseRectangleWin

proc ChooseRectangleSettings
; --------------------------
    ;paint 1 blue Rectangle in the top section and 2 black Rectangle in the middle and the bottom
    ;if ChooseRectangleMovementMain = 0
	cmp [ChooseRectangleMovementSettings], 0
	jne SettingsOption2
	mov [color], 44
	call Settings_Option1
	mov [color], 0
	call Settings_Option2
	call Settings_Option3
	call Settings_Option4
	call Settings_Option5
; --------------------------
    ret
; --------------------------
    ;paint 1 blue Rectangle in the middle section and 2 black Rectangle in the top and the bottom
    ;if ChooseRectangleMovementMain = 1
SettingsOption2:
	cmp [ChooseRectangleMovementSettings], 1
	jne SettingsOption3
	mov [color], 0
	call Settings_Option1
	mov [color], 44
	call Settings_Option2
	mov [color], 0
	call Settings_Option4
	call Settings_Option3
	call Settings_Option5
; --------------------------
    ret
; --------------------------
    ;paint 1 blue Rectangle in the bottom section and 2 black Rectangle in the top and the middle
    ;if ChooseRectangleMovementMain = 2
SettingsOption3:
	cmp [ChooseRectangleMovementSettings], 2
	jne SettingsOption4
	mov [color], 0
	call Settings_Option1
	call Settings_Option2
	mov [color], 44
	call Settings_Option3
	mov [color], 0
	call Settings_Option4
	call Settings_Option5
; --------------------------
    ret
; --------------------------
SettingsOption4:
	cmp [ChooseRectangleMovementSettings], 3
	jne SettingsOption5
	mov [color], 0
	call Settings_Option1
	call Settings_Option2
	call Settings_Option3
	mov [color], 44
	call Settings_Option4
	mov [color], 0
	call Settings_Option5
; --------------------------
	ret
; --------------------------
SettingsOption5:
	cmp [ChooseRectangleMovementSettings], 4
	jne Settings_OptionMax
	mov [color], 0
	call Settings_Option1
	call Settings_Option2
	call Settings_Option3
	call Settings_Option4
	mov [color], 44
	call Settings_Option5
; --------------------------	
	ret
; --------------------------		
Settings_OptionMax:
; --------------------------	
	ret
endp ChooseRectangleSettings

;**********************
;**********************

proc ChooseRectangleMovementWinUp
; --------------------------
    ;check if ChooseRectangleMovementWin < 3
    ;if ChooseRectangleMovementWin < 3
    cmp [ChooseRectangleMovementWin], 3
    ;jamp to IncChooseRectangleMovementWin
    jl IncChooseRectangleMovementWin
; --------------------------
    ;else jamp to FIncChooseRectangleMovementWin
    jmp FIncChooseRectangleMovementWin
; --------------------------
    ;increases ChooseRectangleMovementSettings and calls ChooseRectangleMenu
IncChooseRectangleMovementWin:
    inc [ChooseRectangleMovementWin]
    call ChooseRectangleWin
FIncChooseRectangleMovementWin:
; --------------------------
    ret
; --------------------------
endp ChooseRectangleMovementWinUp


proc ChooseRectangleMovementWinDown
; --------------------------
    ;check if ChooseRectangleMovementSettings > 0
    ;jamp to DecChooseRectangleMovementSettings
    cmp [ChooseRectangleMovementWin], 0
    jg DecChooseRectangleMovementWin
; --------------------------
    ;else jmp to FDecChooseRectangleMovement
    jmp FDecChooseRectangleMovementWin
; --------------------------
    ;decreases ChooseRectangleMovementMain and calls ChooseRectangleMenu
DecChooseRectangleMovementWin:
    dec [ChooseRectangleMovementWin]
    call ChooseRectangleWin
; --------------------------
FDecChooseRectangleMovementWin:
; --------------------------
    ret
; --------------------------
endp ChooseRectangleMovementWinDown

proc ChooseRectangleMovementSettingsUp
; --------------------------
    ;check if ChooseRectangleMovementSettings < 4
    ;if ChooseRectangleMovementSettings < 4
    cmp [ChooseRectangleMovementSettings], 4
    ;jamp to IncChooseRectangleMovementSettings
    jl IncChooseRectangleMovementSettings
; --------------------------
    ;else jamp to FIncChooseRectangleMovement
    jmp FIncChooseRectangleMovementSettings
; --------------------------
    ;increases ChooseRectangleMovementSettings and calls ChooseRectangleMenu
IncChooseRectangleMovementSettings:
    inc [ChooseRectangleMovementSettings]
    call ChooseRectangleSettings
FIncChooseRectangleMovementSettings:
; --------------------------
    ret
; --------------------------
endp ChooseRectangleMovementSettingsUp

proc ChooseRectangleMovementSettingsDown
; --------------------------
    ;check if ChooseRectangleMovementSettings > 0
    ;jamp to DecChooseRectangleMovementSettings
    cmp [ChooseRectangleMovementSettings], 0
    jg DecChooseRectangleMovementSettings
; --------------------------
    ;else jmp to FDecChooseRectangleMovement
    jmp FDecChooseRectangleMovementSettings
; --------------------------
    ;decreases ChooseRectangleMovementMain and calls ChooseRectangleMenu
DecChooseRectangleMovementSettings:
    dec [ChooseRectangleMovementSettings]
    call ChooseRectangleSettings
; --------------------------
FDecChooseRectangleMovementSettings:
; --------------------------
    ret
; --------------------------
endp ChooseRectangleMovementSettingsDown

;**********************
;**********************

proc ChooseRectangleMovementLevelSelctorUp
; --------------------------
    ;check if ChooseRectangleMovementMain < 3
    ;if ChooseRectangleMovementMain < 3
    cmp [ChooseRectangleMovementLevelSelctor], 6
    ;jamp to IncChooseRectangleMovement
    jl IncChooseRectangleMovementLevelSelctor
; --------------------------
    ;else jamp to FIncChooseRectangleMovement
    jmp FIncChooseRectangleMovementLevelSelctor
; --------------------------
    ;increases ChooseRectangleMovementMain and calls ChooseRectangleMenu
IncChooseRectangleMovementLevelSelctor:
    inc [ChooseRectangleMovementLevelSelctor]
    call ChooseRectangleLevelSelctor
FIncChooseRectangleMovementLevelSelctor:
; --------------------------
    ret
; --------------------------
endp ChooseRectangleMovementLevelSelctorUp



proc ChooseRectangleMovementLevelSelctorDown
; --------------------------
    ;check if ChooseRectangleMovementMain > 0
    ;jamp to DecChooseRectangleMovement
    cmp [ChooseRectangleMovementLevelSelctor], 1
    jg DecChooseRectangleMovementLevelSelctor
; --------------------------
    ;else jmp to FDecChooseRectangleMovementLevelSelctor
    jmp FDecChooseRectangleMovementLevelSelctor
; --------------------------
    ;decreases ChooseRectangleMovementMain and calls ChooseRectangleMenu
DecChooseRectangleMovementLevelSelctor:
    dec [ChooseRectangleMovementLevelSelctor]
    call ChooseRectangleLevelSelctor
; --------------------------
FDecChooseRectangleMovementLevelSelctor:
; --------------------------
    ret
; --------------------------
endp ChooseRectangleMovementLevelSelctorDown

;**********************
;**********************

proc ChooseRectangleMovementMenuUp
; --------------------------
    ;check if ChooseRectangleMovementMain < 3
    ;if ChooseRectangleMovementMain < 3
    cmp [ChooseRectangleMovementMain], 3
    ;jamp to IncChooseRectangleMovement
    jl IncChooseRectangleMovement
; --------------------------
    ;else jamp to FIncChooseRectangleMovement
    jmp FIncChooseRectangleMovement
; --------------------------
    ;increases ChooseRectangleMovementMain and calls ChooseRectangleMenu
IncChooseRectangleMovement:
    inc [ChooseRectangleMovementMain]
    call ChooseRectangleMenu
FIncChooseRectangleMovement:
; --------------------------
    ret
; --------------------------
endp ChooseRectangleMovementMenuUp

;**********************
;**********************

proc ChooseRectangleMovementMenuDown
; --------------------------
    ;check if ChooseRectangleMovementMain > 0
    ;jamp to DecChooseRectangleMovement
    cmp [ChooseRectangleMovementMain], 0
    jg DecChooseRectangleMovement
; --------------------------
    ;else jmp to FDecChooseRectangleMovement
    jmp FDecChooseRectangleMovement
; --------------------------
    ;decreases ChooseRectangleMovementMain and calls ChooseRectangleMenu
DecChooseRectangleMovement:
    dec [ChooseRectangleMovementMain]
    call ChooseRectangleMenu
; --------------------------
FDecChooseRectangleMovement:
; --------------------------
    ret
; --------------------------
endp ChooseRectangleMovementMenuDown

;**********************
;**********************


proc LevelOpenPainter
    ;seting the stating point
    mov [x], 105
    mov [y], 70
; --------------------------
    ;create line 3x45 towards right
    mov cx, 35
LevelOpenRight:
    push cx
    call RectangleRight3X3
    pop cx
    loop LevelOpenRight
; --------------------------
    ;create line 3x18 towards down
    mov cx, 35
LevelOpenDown:
    push cx
    call RectangleDown3X3
    pop cx
    loop LevelOpenDown
; --------------------------
    ;create line 3x15 towards left
    mov cx, 34
LevelOpenLeft:
    push cx
    call RectangleLeft3X3
    pop cx
    loop LevelOpenLeft
; --------------------------
    ;create line 3x15 towardsup
    mov cx, 34
LevelOpenUp:
    push cx
    call RectangleUp3X3
    pop cx
    loop LevelOpenUp
; --------------------------
    ret
endp LevelOpenPainter


; proc OpenLevelsProssor
	; push ax
	; push cx
	; mov ax, [word ptr ChooseRectangleMovementLevelSelctor]
	; mov si, offset OpenLevel
	; mov cx, ax
	; mov ax, 1
; levelChecker:
	; inc si
	; loop levelChecker
	; cmp [si], ax
	; jne levelOff
	; mov [color], 55
	; call LevelOpenPainter
	; ret
; levelOff:
	; mov [color], 7
	; call LevelOpenPainter
	; pop ax
	; pop cx
	; ret
; endp OpenLevelsProssor

proc BigBlueLeftArrow
	mov [x], 57
	mov [y], 95
	mov si, offset BlueLeftArrow
	call BigLetterCreator
	ret
endp BigBlueLeftArrow

; **************************
; **************************

proc BigGrayLeftArrow
	mov [x], 57
	mov [y], 95
	mov si, offset GrayLeftArrow
	call BigLetterCreator
	ret
endp BigGrayLeftArrow

; **************************
; **************************

proc BigGrayRightArrow
	mov [x], 300
	mov [y], 95
	mov si, offset GrayRightArrow
	call BigLetterCreator
	ret
endp BigGrayRightArrow

; **************************
; **************************

proc BigBlueRightArrow
	mov [x], 300
	mov [y], 95
	mov si, offset BlueRightArrow
	call BigLetterCreator
	ret
endp BigBlueRightArrow

; **************************
; **************************

proc ChooseRectangleLevelSelctor
	cmp [ChooseRectangleMovementLevelSelctor], 1
	jne Level_2_Selected
; --------------------------
	mov si, offset Level_1
	mov di , 1
	cmp [si], di
	jne Level_1_Close
	mov [color], 55
	call LevelOpenPainter
	jmp AddLevel_1Number
; --------------------------
Level_1_Close:
; --------------------------
	mov [color], 7
	call LevelOpenPainter
; --------------------------
AddLevel_1Number:
; --------------------------
	call BigBlueRightArrow
	call BigGrayLeftArrow
	mov [x], 187
	mov [y], 95
	mov si, offset Namber_1
	call BigLetterCreator
	ret
; --------------------------
Level_2_Selected:
	cmp [ChooseRectangleMovementLevelSelctor], 2
	jne Level_3_Selected
; --------------------------
	mov si, offset Level_2
	mov di , 1
	cmp [si], di
	jne Level_2_Close
	mov [color], 55
	call LevelOpenPainter
	jmp AddLevel_2Number
; --------------------------
Level_2_Close:
; --------------------------
	mov [color], 7
	call LevelOpenPainter
; --------------------------
AddLevel_2Number:
; --------------------------
	call BigBlueLeftArrow
	call BigBlueRightArrow
	mov [x], 187
	mov [y], 95
	mov si, offset Namber_2
	call BigLetterCreator
	ret
; --------------------------
Level_3_Selected:
	cmp [ChooseRectangleMovementLevelSelctor], 3
	jne Level_4_Selected
; --------------------------
	mov si, offset Level_3
	mov di , 1
	cmp [si], di 
	jne Level_3_Close
	mov [color], 55
	call LevelOpenPainter
	jmp AddLevel_3Number
; --------------------------
Level_3_Close:
; --------------------------
	mov [color], 7
	call LevelOpenPainter
; --------------------------
AddLevel_3Number:
; --------------------------
	call BigBlueLeftArrow
	call BigBlueRightArrow
	mov [x], 187
	mov [y], 95
	mov si, offset Namber_3
	call BigLetterCreator
	ret
; --------------------------
Level_4_Selected:
	cmp [ChooseRectangleMovementLevelSelctor], 4
	jne Level_5_Selected
; --------------------------
	mov si, offset Level_4
	mov di , 1
	cmp [si], di
	jne Level_4_Close
	mov [color], 55
	call LevelOpenPainter
	jmp AddLevel_4Number
; --------------------------
Level_4_Close:
; --------------------------
	mov [color], 7
	call LevelOpenPainter
; --------------------------
AddLevel_4Number:
; --------------------------
	call BigBlueLeftArrow
	call BigBlueRightArrow
	mov [x], 187
	mov [y], 95
	mov si, offset Namber_4
	call BigLetterCreator
	ret
; --------------------------
Level_5_Selected:
	cmp [ChooseRectangleMovementLevelSelctor], 5
	jne Level_6_Selected
; --------------------------
	mov si, offset Level_5
	mov di , 1
	cmp [si], di
	jne Level_5_Close
	mov [color], 55
	call LevelOpenPainter
	jmp AddLevel_5Number
; --------------------------
Level_5_Close:
; --------------------------
	mov [color], 7
	call LevelOpenPainter
; --------------------------
AddLevel_5Number:
; --------------------------
	call BigBlueLeftArrow
	call BigBlueRightArrow
	mov [x], 187
	mov [y], 95
	mov si, offset Namber_5
	call BigLetterCreator
	ret
; --------------------------
Level_6_Selected:
	cmp [ChooseRectangleMovementLevelSelctor], 6
	jne Level_7_Selected
; --------------------------
	mov si, offset Level_5
	mov di , 1
	cmp [si], di
	jne Level_6_Close
	mov [color], 55
	call LevelOpenPainter
	jmp AddLevel_6Number
; --------------------------
Level_6_Close:
; --------------------------
	mov [color], 7
	call LevelOpenPainter
; --------------------------
AddLevel_6Number:
; --------------------------
	call BigBlueLeftArrow
	call BigGrayRightArrow
	mov [x], 187
	mov [y], 95
	mov si, offset Namber_6
	call BigLetterCreator
	ret
; --------------------------
Level_7_Selected:
ret
endp ChooseRectangleLevelSelctor

;**********************
;**********************

proc LevelOpener
	cmp [ChooseRectangleMovementLevelSelctor], 1
	jne CheckLevel_2
	mov si , offset Level_2
	mov di , 1
	mov [si], di
	ret
CheckLevel_2:
	cmp [ChooseRectangleMovementLevelSelctor], 2
	jne CheckLevel_3
	mov si , offset Level_3
	mov di , 1
	mov [si], di
	ret
CheckLevel_3:
	ret
endp LevelOpener

proc LevelSelctorEnterCheker
	cmp [ChooseRectangleMovementLevelSelctor], 1
	jne Level_2Selected
; --------------------------
	mov si, offset Level_1
	mov di , 1
	cmp [si], di 
	jne Level_1Close
	mov [GamePlaySelector], 1
	call StartLevel
	ret
; --------------------------
Level_1Close:
; --------------------------
	ret
Level_2Selected:
	cmp [ChooseRectangleMovementLevelSelctor], 2
	jne Level_3Selected
; --------------------------
	mov si, offset Level_2
	mov di , 1
	cmp [si], di 
	jne Level_1Close
	mov [GamePlaySelector], 1
	call StartLevel
	ret
; --------------------------
Level_2Close:
	ret
; --------------------------
Level_3Selected:
	cmp [ChooseRectangleMovementLevelSelctor], 3
	jne Level_4Selected
; --------------------------
	mov si, offset Level_3
	mov di , 1
	cmp [si], di	 
	jne Level_1Close
	mov [GamePlaySelector], 1
	call StartLevel
	ret
; --------------------------
Level_3Close:
	ret
; --------------------------
Level_4Selected:
ret
endp LevelSelctorEnterCheker


proc ChooseRectangleMenu
; --------------------------
    ;paint 1 blue Rectangle in the top section and 2 black Rectangle in the middle and the bottom
    ;if ChooseRectangleMovementMain = 0
	cmp [ChooseRectangleMovementMain], 0
	jne Option2
	mov [color], 44
	call Menu_Option1
	mov [color], 0
	call Menu_Option2
	call Menu_Option3
	call Menu_Option4
; --------------------------
    ret
; --------------------------
    ;paint 1 blue Rectangle in the middle section and 2 black Rectangle in the top and the bottom
    ;if ChooseRectangleMovementMain = 1
Option2:
	cmp [ChooseRectangleMovementMain], 1
	jne Option3
	mov [color], 0
	call Menu_Option1
	mov [color], 44
	call Menu_Option2
	mov [color], 0
	call Menu_Option3
	call Menu_Option4
; --------------------------
    ret
; --------------------------
    ;paint 1 blue Rectangle in the bottom section and 2 black Rectangle in the top and the middle
    ;if ChooseRectangleMovementMain = 2
Option3:
	cmp [ChooseRectangleMovementMain], 2
	jne Option4
	mov [color], 0
	call Menu_Option1
	call Menu_Option2
	mov [color], 44
	call Menu_Option3
	mov [color], 0
	call Menu_Option4
; --------------------------
    ret
; --------------------------
Option4:
	cmp [ChooseRectangleMovementMain], 3
	jne OptionMax
	mov [color], 0
	call Menu_Option1
	call Menu_Option2
	call Menu_Option3
	mov [color], 44
	call Menu_Option4
; --------------------------
	ret
; --------------------------
OptionMax:
; --------------------------
	ret
; --------------------------
endp ChooseRectangleMenu

;**********************
;**********************

proc Letter_I_Creator
; --------------------------
	push ax
	push bx
	push cx
	push dx
; --------------------------
    ;droing 4X5 Rectangle
    mov cx, 5
LoopXLetter_I_Creator:
    push cx
    mov cx, 1
LoopYLetter_I_Creator:
    push cx
	call LevelObjects
    call RectangleLeft4X4
    pop cx
    loop LoopYLetter_I_Creator
	add [x], 4
    add [y], 4
    pop cx
    loop LoopXLetter_I_Creator
; --------------------------
	pop dx
	pop cx
	pop bx
	pop ax
; --------------------------
    ret
; --------------------------
endp Letter_I_Creator

;**********************
;**********************

proc NamberCreator
; --------------------------
	push ax
	push bx
	push cx
	push dx
; --------------------------
    ;droing 4X5 Rectangle
    mov cx, 5
LoopXNamberCreator:
    push cx
    mov cx, 4
LoopYNamberCreator:
    push cx
	call LevelObjects
    call RectangleLeft3X3
    pop cx
    loop LoopYNamberCreator
	add [x], 12
    add [y], 3
    pop cx
    loop LoopXNamberCreator
; --------------------------
	pop dx
	pop cx
	pop bx
	pop ax
; --------------------------
    ret
; --------------------------
endp NamberCreator

;**********************
;**********************

proc Namber_1_Creator
; --------------------------
	push ax
	push bx
	push cx
	push dx
; --------------------------
    ;droing 4X5 Rectangle
    mov cx, 5
LoopXNamber_1_Creator:
    push cx
    mov cx, 3
LoopYNamber_1_Creator:
    push cx
	call LevelObjects
    call RectangleLeft3X3
    pop cx
    loop LoopYNamber_1_Creator
	add [x], 9
    add [y], 3
    pop cx
    loop LoopXNamber_1_Creator
; --------------------------
	pop dx
	pop cx
	pop bx
	pop ax
; --------------------------
    ret
; --------------------------
endp Namber_1_Creator

;**********************
;**********************

proc BigLetterCreator
; --------------------------
	push ax
	push bx
	push cx
	push dx
; --------------------------
    ;droing 4X5 Rectangle
    mov cx, 5
LoopXBigLetterSCreator:
    push cx
    mov cx, 4
LoopYBigLetterSCreator:
    push cx
	call LevelObjects
    call RectangleLeft5X5
    pop cx
    loop LoopYBigLetterSCreator
	add [x], 44
    add [y], 11
    pop cx
    loop LoopXBigLetterSCreator
; --------------------------
	pop dx
	pop cx
	pop bx
	pop ax
; --------------------------
    ret
; --------------------------
endp BigLetterCreator

proc LetterCreator
; --------------------------
	push ax
	push bx
	push cx
	push dx
; --------------------------
    ;droing 4X5 Rectangle
    mov cx, 5
LoopXLetterSCreator:
    push cx
    mov cx, 4
LoopYLetterSCreator:
    push cx
	call LevelObjects
    call RectangleLeft4X4
    pop cx
    loop LoopYLetterSCreator
	add [x], 16
    add [y], 4
    pop cx
    loop LoopXLetterSCreator
; --------------------------
	pop dx
	pop cx
	pop bx
	pop ax
; --------------------------
    ret
; --------------------------
endp LetterCreator

;**********************
;**********************

proc LetterCreator5X5
; --------------------------
	push ax
	push bx
	push cx
	push dx
; --------------------------
    ;droing 4X5 Rectangle
    mov cx, 5
LoopXLetterSCreator5X5:
    push cx
    mov cx, 5
LoopYLetterSCreator5X5:
    push cx
	call LevelObjects
    call RectangleLeft4X4
    pop cx
    loop LoopYLetterSCreator5X5
	add [x], 20
    add [y], 4
    pop cx
    loop LoopXLetterSCreator5X5
; --------------------------
	pop dx
	pop cx
	pop bx
	pop ax
; --------------------------
    ret
; --------------------------
endp LetterCreator5X5

;**********************
;**********************

proc MenuOpeningScreen
	mov dx, offset PlayButten
	mov ah, 9h
	int 21h
	mov dx, offset settingsButten
	mov ah, 9h
	int 21h
	mov dx, offset CreditsButten
	mov ah, 9h
	int 21h
	mov dx, offset ExitButten
	mov ah, 9h
	int 21h
; --------------------------
	mov [y], 50
	mov [x], 85
	mov si, offset Letter_s
	call LetterCreator
; --------------------------
	add [x], 22
	sub [y], 20
	mov si, offset Letter_c
	call LetterCreator
; --------------------------
	add [x], 22
	sub [y], 20
	mov si, offset Letter_r
	call LetterCreator
; --------------------------
	add [x], 22
	sub [y], 20
	mov si, offset Letter_o
	call LetterCreator
; --------------------------
	add [x], 22
	sub [y], 20
	mov si, offset Letter_l
	call LetterCreator
; --------------------------
	add [x], 22
	sub [y], 20
	mov si, offset Letter_l
	call LetterCreator
; --------------------------
	add [x], 22
	sub [y], 20
	mov si, offset Letter_e
	call LetterCreator
; --------------------------	
	add [x], 22
	sub [y], 20
	mov si, offset Letter_r
	call LetterCreator
; --------------------------
	ret
; --------------------------
endp MenuOpeningScreen

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

proc DesplayTimer
; --------------------------
	call EndTimer
	call TestTimersMinutes
	call TestTimersSeconds
	call RearrangeTimerNombers
	call PlayerTimeOutPut
; --------------------------
	ret
; --------------------------
endp DesplayTimer

;**********************
;**********************

proc WinScreen
; --------------------------
	push dx
	push ax
; --------------------------
	call Text_Mode
	call Graphic_Mode
; --------------------------
	mov [y], 10
	mov [x], 100
	mov si, offset Letter_y
	call LetterCreator
; --------------------------
	add [x], 22
	sub [y], 20
	mov si, offset Letter_o
	call LetterCreator
; --------------------------
	add [x], 22
	sub [y], 20
	mov si, offset Letter_u
	call LetterCreator
; --------------------------
	add [x], 42
	sub [y], 20
	mov si, offset Letter_w
	call LetterCreator5X5
; --------------------------
	add [x], 22
	sub [y], 20
	mov si, offset Letter_o
	call LetterCreator
; --------------------------
	add [x], 22
	sub [y], 20
	mov si, offset Letter_n
	call LetterCreator
; --------------------------
	mov [x], 190
	mov [y], 90
	mov si, offset restart
	call IconsCreator
; --------------------------
	mov [x], 70
	mov [y], 95
	mov si, offset BlueLeftArrow
	call BigLetterCreator
; --------------------------
	mov [x], 290
	mov [y], 95
	mov si, offset BlueRightArrow
	call BigLetterCreator
; --------------------------
	
	call DesplayTimer
	call ResetTimer
	mov dx, offset Win_Navigators
	mov ah, 9h
	int 21h
	mov [ChooseRectangleMovementWin],2
	call ChooseRectangleWin
	call LevelOpener
	cmp [SoundOnOff], 1
	jne QuiteWin
	mov [SoundTime], 2
	call StartSound
QuiteWin:
	mov [GamePlaySelector], 2
; --------------------------
	pop ax
	pop dx
; --------------------------
	ret
; --------------------------
endp WinScreen

proc WinEnterCheker
	cmp [ChooseRectangleMovementWin], 0
	jne RestartLevles
	mov [GamePlaySelector], 0
	call StartLevelSelecter
	ret
RestartLevles:
	cmp [ChooseRectangleMovementWin], 1
	jne NextLevel
	call RestartLevel
	ret
NextLevel:
	cmp [ChooseRectangleMovementWin], 2
	jne WinExit
	call ChooseRectangleMovementLevelSelctorUp
	call LevelSelctorEnterCheker
	ret
WinExit:
	ret
endp WinEnterCheker

proc Win_key_Test
Win_right:
	cmp ah, 20h ;right
	jne Win_Left
; --------------------------
	call ChooseRectangleMovementWinUp
; --------------------------
	ret
Win_Left:
; --------------------------
	cmp ah, 1Eh ;left
	jne Win_Enter
; --------------------------
	call ChooseRectangleMovementWinDown
; --------------------------
	ret
; --------------------------
Win_Enter:
    ;Detect enter
    cmp ah, 1Ch
    jne Win_ToExit
    call WinEnterCheker
; --------------------------
    ret
; --------------------------
Win_ToExit:
	ret


endp Win_key_Test

;**********************
;**********************

proc RestartLevel
	call Text_Mode
	call Graphic_Mode
	call LevelSelctorEnterCheker
	call PlayerCreator
	call StartTimer
	ret
endp RestartLevel

;**********************
;**********************
proc Win_Option1
    ;seting the stating point
    mov [x], 15
    mov [y], 90
; --------------------------
    ;create line 3x45 towards right
    mov cx, 21
Win_Option1Right:
    push cx
    call RectangleRight3X3
    pop cx
    loop Win_Option1Right
; --------------------------
    ;create line 3x18 towards down
    mov cx, 21
Win_Option1Down:
    push cx
    call RectangleDown3X3
    pop cx
    loop Win_Option1Down
; --------------------------
    ;create line 3x15 towards left
    mov cx, 20
Win_Option1Left:
    push cx
    call RectangleLeft3X3
    pop cx
    loop Win_Option1Left
; --------------------------
    ;create line 3x15 towardsup
    mov cx, 20
Win_Option1Up:
    push cx
    call RectangleUp3X3
    pop cx
    loop Win_Option1Up
; --------------------------
    ret
endp Win_Option1

proc Win_Option2
    ;seting the stating point
    mov [x], 120
    mov [y], 88
; --------------------------
    ;create line 3x45 towards right
    mov cx, 24
Win_Option2Right:
    push cx
    call RectangleRight3X3
    pop cx
    loop Win_Option2Right
; --------------------------
    ;create line 3x18 towards down
    mov cx, 24
Win_Option2Down:
    push cx
    call RectangleDown3X3
    pop cx
    loop Win_Option2Down
; --------------------------
    ;create line 3x15 towards left
    mov cx, 23
Win_Option2Left:
    push cx
    call RectangleLeft3X3
    pop cx
    loop Win_Option2Left
; --------------------------
    ;create line 3x15 towardsup
    mov cx, 23
Win_Option2Up:
    push cx
    call RectangleUp3X3
    pop cx
    loop Win_Option2Up
; --------------------------
    ret
endp Win_Option2

proc Win_Option3
    ;seting the stating point
    mov [x], 235
    mov [y], 90
; --------------------------
    ;create line 3x45 towards right
    mov cx, 21
Win_Option3Right:
    push cx
    call RectangleRight3X3
    pop cx
    loop Win_Option3Right
; --------------------------
    ;create line 3x18 towards down
    mov cx, 21
Win_Option3Down:
    push cx
    call RectangleDown3X3
    pop cx
    loop Win_Option3Down
; --------------------------
    ;create line 3x15 towards left
    mov cx, 20
Win_Option3Left:
    push cx
    call RectangleLeft3X3
    pop cx
    loop Win_Option3Left
; --------------------------
    ;create line 3x15 towardsup
    mov cx, 20
Win_Option3Up:
    push cx
    call RectangleUp3X3
    pop cx
    loop Win_Option3Up
; --------------------------
    ret
endp Win_Option3


proc Settings_Option1
    ;seting the stating point
    mov [x], 1
    mov [y], 43
; --------------------------
    ;create line 3x45 towards right
    mov cx, 35
Settings_Option1Right:
    push cx
    call RectangleRight3X3
    pop cx
    loop Settings_Option1Right
; --------------------------
    ;create line 3x18 towards down
    mov cx, 6
Settings_Option1Down:
    push cx
    call RectangleDown3X3
    pop cx
    loop Settings_Option1Down
; --------------------------
    ;create line 3x15 towards left
    mov cx, 34
Settings_Option1Left:
    push cx
    call RectangleLeft3X3
    pop cx
    loop Settings_Option1Left
; --------------------------
    ;create line 3x15 towardsup
    mov cx, 5
Settings_Option1Up:
    push cx
    call RectangleUp3X3
    pop cx
    loop Settings_Option1Up
; --------------------------
    ret
endp Settings_Option1

;**********************
;**********************

proc Settings_Option2
    ;seting the stating point
    mov [x], 1
    mov [y], 67
; --------------------------
    ;create line 3x45 towards right
    mov cx, 35
Settings_Option2Right:
    push cx
    call RectangleRight3X3
    pop cx
    loop Settings_Option2Right
; --------------------------
    ;create line 3x18 towards down
    mov cx, 6
Settings_Option2Down:
    push cx
    call RectangleDown3X3
    pop cx
    loop Settings_Option2Down
; --------------------------
    ;create line 3x15 towards left
    mov cx, 34
Settings_Option2Left:
    push cx
    call RectangleLeft3X3
    pop cx
    loop Settings_Option2Left
; --------------------------
    ;create line 3x15 towardsup
    mov cx, 5
Settings_Option2Up:
    push cx
    call RectangleUp3X3
    pop cx
    loop Settings_Option2Up
; --------------------------
    ret
endp Settings_Option2

;**********************
;**********************

proc Settings_Option3
    ;seting the stating point
    mov [x], 1
    mov [y], 90
; --------------------------
    ;create line 3x45 towards right
    mov cx, 16
Settings_Option3Right:
    push cx
    call RectangleRight3X3
    pop cx
    loop Settings_Option3Right
; --------------------------
    ;create line 3x18 towards down
    mov cx, 6
Settings_Option3Down:
    push cx
    call RectangleDown3X3
    pop cx
    loop Settings_Option3Down
; --------------------------
    ;create line 3x15 towards left
    mov cx, 15
Settings_Option3Left:
    push cx
    call RectangleLeft3X3
    pop cx
    loop Settings_Option3Left
; --------------------------
    ;create line 3x15 towardsup
    mov cx, 5
Settings_Option3Up:
    push cx
    call RectangleUp3X3
    pop cx
    loop Settings_Option3Up
; --------------------------
    ret
endp Settings_Option3

;**********************
;**********************

proc Settings_Option4
    ;seting the stating point
    mov [x], 1
    mov [y], 115
; --------------------------
    ;create line 3x45 towards right
    mov cx, 35
Settings_Option4Right:
    push cx
    call RectangleRight3X3
    pop cx
    loop Settings_Option4Right
; --------------------------
    ;create line 3x18 towards down
    mov cx, 6
Settings_Option4Down:
    push cx
    call RectangleDown3X3
    pop cx
    loop Settings_Option4Down
; --------------------------
    ;create line 3x15 towards left
    mov cx, 34
Settings_Option4Left:
    push cx
    call RectangleLeft3X3
    pop cx
    loop Settings_Option4Left
; --------------------------
    ;create line 3x15 towardsup
    mov cx, 5
Settings_Option4Up:
    push cx
    call RectangleUp3X3
    pop cx
    loop Settings_Option4Up
; --------------------------
    ret
endp Settings_Option4

;**********************
;**********************

proc Settings_Option5
    ;seting the stating point
    mov [x], 1
    mov [y], 138
; --------------------------
    ;create line 3x45 towards right
    mov cx, 15
Settings_Option5Right:
    push cx
    call RectangleRight3X3
    pop cx
    loop Settings_Option5Right
; --------------------------
    ;create line 3x18 towards down
    mov cx, 6
Settings_Option5Down:
    push cx
    call RectangleDown3X3
    pop cx
    loop Settings_Option5Down
; --------------------------
    ;create line 3x15 towards left
    mov cx, 14
Settings_Option5Left:
    push cx
    call RectangleLeft3X3
    pop cx
    loop Settings_Option5Left
; --------------------------
    ;create line 3x15 towardsup
    mov cx, 5
Settings_Option5Up:
    push cx
    call RectangleUp3X3
    pop cx
    loop Settings_Option5Up
; --------------------------
    ret
endp Settings_Option5

;**********************
;**********************

proc Menu_Option1
    ;seting the stating point
    mov [x], 126
    mov [y], 75
; --------------------------
    ;create line 3x45 towards right
    mov cx, 15
Menu_Option1Right:
    push cx
    call RectangleRight3X3
    pop cx
    loop Menu_Option1Right
; --------------------------
    ;create line 3x18 towards down
    mov cx, 6
Menu_Option1Down:
    push cx
    call RectangleDown3X3
    pop cx
    loop Menu_Option1Down
; --------------------------
    ;create line 3x15 towards left
    mov cx, 14
Menu_Option1Left:
    push cx
    call RectangleLeft3X3
    pop cx
    loop Menu_Option1Left
; --------------------------
    ;create line 3x15 towardsup
    mov cx, 5
Menu_Option1Up:
    push cx
    call RectangleUp3X3
    pop cx
    loop Menu_Option1Up
; --------------------------
    ret
endp Menu_Option1

;**********************
;**********************

proc Menu_Option2
    ;seting the stating point
    mov [x], 113
    mov [y], 98
; --------------------------
    ;create line 3x45 towards right
    mov cx, 24
Menu_Option2Right:
    push cx
    call RectangleRight3X3
    pop cx
    loop Menu_Option2Right
; --------------------------
    ;create line 3x18 towards down
    mov cx, 6
Menu_Option2Down:
    push cx
    call RectangleDown3X3
    pop cx
    loop Menu_Option2Down
; --------------------------
    ;create line 3x15 towards left
    mov cx, 23
Menu_Option2Left:
    push cx
    call RectangleLeft3X3
    pop cx
    loop Menu_Option2Left
; --------------------------
    ;create line 3x15 towardsup
    mov cx, 5
Menu_Option2Up:
    push cx
    call RectangleUp3X3
    pop cx
    loop Menu_Option2Up
; --------------------------
    ret

endp Menu_Option2

;**********************
;**********************

proc Menu_Option3
    ;seting the stating point
    mov [x], 122
    mov [y], 122
; --------------------------
    ;create line 3x45 towards right
    mov cx, 18
Menu_Option3Right:
    push cx
    call RectangleRight3X3
    pop cx
    loop Menu_Option3Right
; --------------------------
    ;create line 3x18 towards down
    mov cx, 6
Menu_Option3Down:
    push cx
    call RectangleDown3X3
    pop cx
    loop Menu_Option3Down
; --------------------------
    ;create line 3x15 towards left
    mov cx, 17
Menu_Option3Left:
    push cx
    call RectangleLeft3X3
    pop cx
    loop Menu_Option3Left
; --------------------------
    ;create line 3x15 towardsup
    mov cx, 5
Menu_Option3Up:
    push cx
    call RectangleUp3X3
    pop cx
    loop Menu_Option3Up
; --------------------------
    ret

endp Menu_Option3

;**********************
;**********************

proc Menu_Option4
    ;seting the stating point
    mov [x], 126
    mov [y], 148
; --------------------------
    ;create line 3x45 towards right
    mov cx, 15
Menu_Option4Right:
    push cx
    call RectangleRight3X3
    pop cx
    loop Menu_Option4Right
; --------------------------
    ;create line 3x18 towards down
    mov cx, 6
Menu_Option4Down:
    push cx
    call RectangleDown3X3
    pop cx
    loop Menu_Option4Down
; --------------------------
    ;create line 3x15 towards left
    mov cx, 14
Menu_Option4Left:
    push cx
    call RectangleLeft3X3
    pop cx
    loop Menu_Option4Left
; --------------------------
    ;create line 3x15 towardsup
    mov cx, 5
Menu_Option4Up:
    push cx
    call RectangleUp3X3
    pop cx
    loop Menu_Option4Up
; --------------------------
    ret

endp Menu_Option4

;**********************
;**********************

proc Settings_Key_Test
; --------------------------
    ;Detect down
    cmp ah, 1Fh
    jne Settings_up
    call ChooseRectangleMovementSettingsUp
    ret
; --------------------------
Settings_up:
    ;Detect up
    cmp ah, 11h
    jne Settings_Enter
    call ChooseRectangleMovementSettingsDown
    ret
; --------------------------
Settings_Enter:
    ;Detect enter
    cmp ah, 1Ch
    jne Settings_ToExit
    call SettingsEnterCheker
; --------------------------
    ret
; --------------------------
Settings_ToExit:
; --------------------------
	ret
; --------------------------
endp Settings_Key_Test



proc LevelSelctor_key_test
LevelSelctor_right:
	cmp ah, 20h ;right
	jne LevelSelctor_Left
; --------------------------
	call ChooseRectangleMovementLevelSelctorUp
; --------------------------
	ret
LevelSelctor_Left:
; --------------------------
	cmp ah, 1Eh ;left
	jne LevelSelctor_Enter
; --------------------------
	call ChooseRectangleMovementLevelSelctorDown
; --------------------------
	ret
; --------------------------
LevelSelctor_Enter:
    ;Detect enter
    cmp ah, 1Ch
    jne LevelSelctor_escp
    call LevelSelctorEnterCheker
; --------------------------
    ret
; --------------------------
LevelSelctor_escp:
	cmp ah, 1h 	;esc
	jne LevelSelctor_ToExit
; --------------------------
	call MenuScreen
; --------------------------
	ret
LevelSelctor_ToExit:
	ret
endp LevelSelctor_key_test

;**********************
;**********************

proc GamePlayOrganizer
	cmp [GamePlaySelector], 0
	jne PlayScreen
	call LevelSelctor_key_test
	ret
PlayScreen:
	cmp [GamePlaySelector], 1
	jne WinningScreen
	call Play_key_test
	ret
WinningScreen:
	cmp [GamePlaySelector], 2
	jne LosingScreen
	call Win_key_Test
	ret
LosingScreen:
	cmp [GamePlaySelector], 3
	jne GamePlayError
	;call Fail_Key_test
GamePlayError:
	ret
endp GamePlayOrganizer


proc MenuOrganizer
; --------------------------
	cmp [ScreenSelector], 0
	jne LevelSelctorScreen
	call Menu_Key_Test
	ret
; --------------------------
LevelSelctorScreen:
	cmp [ScreenSelector], 1
	jne SettingsScreen
	call GamePlayOrganizer
	ret
; --------------------------
SettingsScreen:
	cmp [ScreenSelector], 2
	jne CreditScreen
	call Settings_Key_Test
	ret
; --------------------------
CreditScreen:
	cmp [ScreenSelector], 3
	jne ExitScreen
	;call Credit_Key_Test
	ret
; --------------------------
ExitScreen:
	cmp [ScreenSelector], 4
	jne errorScreen
	;call Exit_Key_Test
	ret
; --------------------------
errorScreen:
; --------------------------
	ret
; --------------------------
endp MenuOrganizer

;**********************
;**********************

proc Play_key_test
; --------------------------
	cmp ah, 1Eh ;left
	jne Play_right
; --------------------------
	call PlayerMoveLeft
; --------------------------
	ret
; --------------------------
Play_right:
	cmp ah, 20h ;right
	jne Play_up
; --------------------------
	call PlayerMoveRight
; --------------------------
	ret
; --------------------------
Play_up:
	cmp ah, 11h ;up
	jne Play_down
; --------------------------
	call PlayerMoveUp
; --------------------------
	ret
; --------------------------
Play_down:
	cmp ah, 1Fh ;down
	jne Play_restart
; --------------------------
	call PlayerMoveDown
; --------------------------
	ret
; --------------------------
Play_restart:
	cmp ah, 13h ;restart
	jne Play_escp
; --------------------------
	call RestartLevel
; --------------------------
	ret
; --------------------------
Play_escp:
	cmp ah, 1h 	;esc
	jne Play_ToExit
; --------------------------
	mov [GamePlaySelector], 0
	call StartLevelSelecter
; --------------------------
	ret
; --------------------------
Play_ToExit:
; --------------------------
	ret
; --------------------------
endp Play_key_test


;**********************
;**********************

proc MenuScreen
	call Text_Mode
	call Graphic_Mode
	call MenuOpeningScreen
	call ChooseRectangleMenu
	mov [ScreenSelector], 0
	ret
endp MenuScreen

;**********************
;**********************

start:
	mov ax, @data
	mov ds, ax
; --------------------------
	call MenuScreen
; --------------------------
	WaitForData:
	mov ah, 1
	int 16h
	jz WaitForData	
	call MenuOrganizer
	mov ah, 0 ; there is a key in the buffer, read it and clear the buffer
	int 16h 
	jmp WaitForData
; --------------------------
exit:
	mov ax, 4c00h
	int 21h
END start