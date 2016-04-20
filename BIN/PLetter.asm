IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
color 	db  2
Max_X dw ?
Max_Y dw ?
X_axis 	dw 30
Y_axis 	dw 130
cxholder1 dw ?
cxholder2 dw ?
a dw 8,10,0,0,1,1,1,1,1,1,1,1,0,0,8 dup (1),4 dup (1,1,0,0,1,1,0,0,0,0),0,0,8 dup (1),0,0,8 dup (1)
        
; --------------------------
CODESEG

proc stop 
	mov ah, 0
	int 16h
	ret
endp stop

proc PaintDot
; --------------------------
	;paint a dot on the screen
	xor bl,bl
	mov al, [color]
	mov bl, 0
	mov cx, [X_axis]
	mov dx,[Y_axis]
	mov ah,0ch
	int 10h
	ret
; --------------------------
endp PaintDot

proc PrintLetter
	mov si, offset a
	mov cx, 8
loopX:
	push cx 
	mov cx, 10 
loopY:
	push cx
	inc si
	mov bx,[si]
	cmp bx, 1
	jne nope
	call PaintDot
nope:
	inc [Y_axis]
	pop cx
	loop loopY
	ret
endp PrintLetter

proc PrintA
; --------------------------
	;set the max hight and the watht
	mov si, offset a
	mov bx, [si]
	mov [Max_X], bx
	inc si
	mov bx, [si]
	mov [Max_Y], bx
; --------------------------
	mov cx, [Max_X]
loopXA:
	mov [cxholder1], cx
	mov cx, [Max_Y]
loopYA:
	mov [cxholder2], cx
	inc si
	mov bx, [si] 
	cmp bx, 1
	jne BlackDot
	call PaintDot
BlackDot:
	inc [Y_axis] 
	mov cx,[cxholder2]
	loop loopYA
	mov bx, [Max_Y]
	sub [Y_axis], bx
	mov cx, [cxholder1]
	inc [X_axis]
	call stop
	loop loopXA
	ret
endp PrintA






start:
	mov ax, @data
	mov ds, ax
; --------------------------
	;go to grafic mode
	mov ax, 13h
	int 10h
; --------------------------
	;call PrintA
	call PrintLetter
; --------------------------
	;what for click
	mov ah, 0
	int 16h
	;go to text mode
	mov ah, 0
	mov al, 2
	int 10h
; --------------------------
	
exit:
	mov ax, 4c00h
	int 21h
END start


