IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
color 	db  16
Max_X dw ?
Max_Y dw ?
X_axis 	dw 30
Y_axis 	dw 130
a 		dw 8,10,0,0,8 dup (1),0,0,8 dup (1),4 dup (1,1,0,0,1,1,0,0,0,0),0,0,8 dup (1),0,0,8 dup (1)        
; --------------------------
CODESEG

proc PaintDot
; --------------------------
	;paint a dot on the screen
	xor bx,bx
	mov al, [color]
	mov bl, 0
	mov cx, [X_axis]
	mov dx,[Y_axis]
	mov ah,0ch
	int 10h
	ret
; --------------------------
endp PaintDot

proc PrintA
	mov si, offset a
	mov bx, [si]
	mov [Max_X], bx
	inc si
	mov bx, [si]
	mov [Max_Y]
; --------------------------
	mov cx, [Max_X]
loopXA:
	push cx
	mov cx, [Max_Y]
loopYA:
	push cx
	inc si
	cmp [si], 1
	jne BlackDot
	call PaintDot
BlackDot:
	add [Y_axis]
	pop cx
	loop loopYA
	mov bx, [Max_Y]
	sub [Y_axis], bx
	pop cx
	add [X_axis]
	loop loopXA
endp PrintA
start:
	mov ax, @data
	mov ds, ax
; --------------------------
	call PrintA
	mov ah, 1
	int 16h
; --------------------------
	
exit:
	mov ax, 4c00h
	int 21h
END start


