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
; --------------------------
CODESEG

proc key_test
	cmp ah, 1Eh ;left
	jne right
	;mov dx, offset messageleft
	;mov ah, 9h
	;int 21h
	mov cx,5
	loopleft:
	sub [x], 1h
	call PaintDot
	loop loopleft
	ret
right:
	cmp ah, 20h ;right
	jne up
	;mov dx, offset messageright
	;mov ah, 9h
	;int 21h
	mov cx,5
	loopright:
	add [x], 1h
	call PaintDot
	loop loopright
	ret
up:
	cmp ah, 11h ;up
	jne down
	;mov dx, offset messageup
	;mov ah, 9h
	;int 21h
	mov cx,5
	loopup:
	sub [y], 1h
	call PaintDot
	loop loopup
	ret
down:
	cmp ah, 1Fh ;down
	jne escp
	;mov dx, offset messagedown
	;mov ah, 9h
	;int 21h
	mov cx,5
	loopdown:
	add [y], 1h
	call PaintDot
	loop loopdown
	ret
escp:
	cmp ah, 1h 	;esc
	jne space
	mov ah, 0
	mov al, 2
	int 10h
	mov ah, 4Ch
	int 21h
	ret
space:
	or [TogelRectangle]
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


start:
	mov ax, @data
	mov ds, ax
; --------------------------
; Graphic mode
	mov ax, 13h
	int 10h
; --------------------------
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