IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
messagestart	db 'press w,a,s,d to move or esc to exit',13,10,'$'
messageleft		db 'move left'	,13,10,'$'
messageright	db 'move right'	,13,10,'$'
messageup 		db 'move up'	,13,10,'$'
messagedown		db 'move down'	,13,10,'$'
messageerror	db 'error: not the right key try w,a,s,d'	,13,10,'$'
x 				dw 160
y				dw 100
color			db 1
TogelRectangle	db 0
note 			dw ?
Clock 			equ es:6Ch
; --------------------------
CODESEG

proc key_test
	cmp ah, 1Eh ;left
	jne right
	mov cx,5
	loopleft:
	sub [x], 1h
	call PaintDot
	loop loopleft
	call closespekers
	call openspekers
	mov [note], 2394h
	call sunduotput
	call delay
	ret
right:
	cmp ah, 20h ;right
	jne up
	mov cx,5
	loopright:
	add [x], 1h
	call PaintDot
	loop loopright
	call closespekers
	call openspekers
	mov [note], 2420h
	call sunduotput
	call delay
	ret
up:
	cmp ah, 11h ;up
	jne down
	mov cx,5
	loopup:
	sub [y], 1h
	call PaintDot
	loop loopup
	call closespekers
	call openspekers
	mov [note], 2711h
	call sunduotput
	call delay
	ret
down:
	cmp ah, 1Fh ;down
	jne escp
	mov cx,5
	loopdown:
	add [y], 1h
	call PaintDot
	loop loopdown
	call openspekers
	mov [note], 3043h
	call sunduotput
	call delay
	ret
escp:
	cmp ah, 1h 	;esc
	jne space
	call closespekers
	mov ah, 0
	mov al, 2
	int 10h
	mov ah, 4Ch
	int 21h	
	ret
space:
	cmp ah, 39h
	jne key_test_exit
	call closespekers
key_test_exit:
	ret
endp key_test

proc PaintDot
	push cx
; Print green dot
	cmp [TogelRectangle], 1
	mov bh,0h
	mov cx,[x]
	mov dx,[y]
	mov al,[color]
	mov ah,0ch
	int 10h
	inc [color]
	cmp [color] , 10
	jne toexit
	mov [color], 1
	toexit:
	pop cx
	ret
endp PaintDot

proc delay
	mov ax, 40h
	mov es, ax
	mov ax, [Clock]
	FirstTick:
	cmp ax, [Clock]
	je FirstTick
	; count 10 sec
	mov cx, 2 ;10x0.055sec = ~0.5sec
	DelayLoop:
	mov ax, [Clock]
	Tick:
	cmp ax, [Clock]
	je Tick
	loop DelayLoop
	call closespekers
	ret
endp delay


proc openspekers
	in al, 61h
	or al, 00000011b
	out 61h, al
; --------------------------
	mov al, 0B6h
	out 43h, al
	ret
endp openspekers

;**********************
;**********************

proc closespekers
	in al, 61h
	and al, 11111100b
	out 61h, al
	ret
endp closespekers

proc sunduotput
	mov al, 98h
	out 42h, al ; Sending lower byte
	mov al, 0Ah
	out 42h, al 
	ret	
endp sunduotput

start:
	mov ax, @data
	mov ds, ax
; --------------------------
; Graphic mode
	mov ax, 13h
	int 10h
; --------------------------
	;call openspekers
	mov dx, offset messagestart
	mov ah, 9h
	int 21h
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