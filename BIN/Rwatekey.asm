IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
x dw 160
y dw 100
color db 2
MovmentCounter db 3 dup (0)


; --------------------------
CODESEG

;***************************
proc PaintDot
; --------------------------
	;paint a dot on the screen
	mov al, [color]
	mov bl, 0
	mov cx, [x]
	mov dx,[y]
	mov ah,0ch
	int 10h
	ret
; --------------------------
endp PaintDot

;***************************
;***************************

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

;***************************
;***************************

;Detect what key pressed
proc KeyDetection
; --------------------------
	;Detect left
	cmp ah, 1Eh
	jne right
	call RectangleLeft3X3
	ret
; --------------------------
right:
	;Detect right
	cmp ah, 20h
	jne up
	call RectangleRight3X3
	ret
; --------------------------
up:
	;Detect up
	cmp ah, 11h
	jne down
	call RectangleUp3X3
	ret
; --------------------------
down:
	;Detect down
	cmp ah, 1Fh
	jne escp
	call RectangleDown3X3
	ret
; --------------------------
escp:
	;Detect esc
	cmp ah, 1h
	jne null
	mov ah, 0
	mov al, 2
	int 10h
	mov ah, 4Ch
	int 21h	
; --------------------------
null: 
	ret
endp KeyDetection

;***************************
;***************************

start:
	mov ax, @data
	mov ds, ax
; --------------------------
	;go to grafic mode
	mov ax, 13h
	int 10h
; --------------------------
	;wate for key to press
	WaitForData:
	mov [color], 2
	mov ah, 1
	int 16h
	jz WaitForData
; --------------------------
	;
	call KeyDetection
	mov ah, 0 
	int 16h
	jmp WaitForData
; --------------------------
exit:
	mov ax, 4c00h
	int 21h
END start


