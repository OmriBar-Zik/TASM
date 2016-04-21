;Rectangle
IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
x dw 160
y dw 100
color db 2
ChooseRectangleMovement dw 	0	   			 
;ChooseRectangleMovement bw layer, layer1 place, layer2 place
; --------------------------
;text
TEnter 	db 	10,13,	'$'
TAtk 	db 	'ATK',	'$'
TDef 	db 	'DEF',	'$'
TFlee 	db	'FLEE',	'$'
TSpace 	db 	' ',	'$'
; --------------------------
CODESEG
;***************************

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
;@@@@@@@@@@@@@@@@@@@@@@@@@
;Rectangle5X5

proc RectangleUp5X5
; --------------------------
	;good starting point
	sub [y], 3
	sub [x], 2
; --------------------------
	;droing 5X5 Rectangle
	mov cx, 5
loopYUp5X5:
	push cx
	mov cx, 5
loopXUp5X5:
	push cx
	call PaintDot
	inc [x]
	pop cx 
	loop loopXUp5X5
	sub [x], 5
	pop cx
	dec [y]
	loop loopYUp5X5
; --------------------------
	;to senter the starting point
	add [y], 3
	add [x], 2
; --------------------------
	ret
endp RectangleUp5X5

;***************************
;***************************

proc RectangleDown5X5
; --------------------------
	;good starting point
	add [y], 3
	sub [x], 2
; --------------------------
	;droing 5X5 Rectangle
	mov cx, 5
loopYDown5X5:
	push cx
	mov cx, 5
loopXDown5X5:
	push cx
	call PaintDot
	inc [x]
	pop cx 
	loop loopXDown5X5
	sub [x], 5
	pop cx
	inc [y]
	loop loopYDown5X5
; --------------------------
;to senter the starting point
	sub [y], 3
	add [x], 2
; --------------------------
	ret
endp RectangleDown5X5

;***************************
;***************************

proc RectangleLeft5X5
; --------------------------
	;good starting point
	sub [x], 3
	add [y], 2
; --------------------------
	;droing 5X5 Rectangle
	mov cx, 5
LooXLeft5X5:
	push cx
	mov cx, 5
LoopYLeft5X5:
	push cx
	call PaintDot
	dec [y]
	pop cx 
	loop LoopYLeft5X5
	add [y], 5
	pop cx 
	dec [x]
	loop LooXLeft5X5
; --------------------------
	;to senter the starting point
	add [x], 3
	sub [y], 2 
; --------------------------
	ret	

endp RectangleLeft5X5

;***************************
;***************************

proc RectangleRight5X5
; --------------------------
	;good starting point
	add [x], 3
	add [y], 2
; --------------------------
	;droing 5X5 Rectangle 
	mov cx, 5
LooXRight5X5:
	push cx
	mov cx, 5
LoopYRight5X5:
	push cx
	call PaintDot
	dec [y]
	pop cx 
	loop LoopYRight5X5
	add [y], 5
	pop cx 
	inc [x]
	loop LooXRight5X5
; --------------------------
	;to senter the startung point
	sub [x], 3
	sub [y], 2
; --------------------------
	ret	
endp RectangleRight5X5


;@@@@@@@@@@@@@@@@@@@@@@@@@
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

proc ChooseRectangleMovementUp
	cmp [ChooseRectangleMovement], 2
	jl IncChooseRectangleMovement 
; --------------------------
	jmp FIncChooseRectangleMovement
; --------------------------
IncChooseRectangleMovement:
	inc [ChooseRectangleMovement]
	call ChooseRectangle
FIncChooseRectangleMovement:
	ret
endp ChooseRectangleMovementUp

;***************************
;***************************

proc ChooseRectangleMovementdown
	cmp [ChooseRectangleMovement], 0
	jg DecChooseRectangleMovement
; --------------------------
	jmp FDecChooseRectangleMovement
; --------------------------
DecChooseRectangleMovement:
	dec [ChooseRectangleMovement]
	call ChooseRectangle
; --------------------------
	FDecChooseRectangleMovement:
	ret
endp ChooseRectangleMovementdown

;***************************
;***************************

proc EnterCheker 
	
	
	
endp EnterCheker

;***************************
;***************************

proc KeyDetection
; --------------------------
	;Detect down 
	cmp ah, 1Fh
	jne up
	call ChooseRectangleMovementUp
	ret
; --------------------------
up:
	;Detect up
	cmp ah, 11h
	jne toenter
	call ChooseRectangleMovementdown	
	ret
; --------------------------
toenter:
	;Detect enter
	cmp ah, 1Fh
	jne escp
	
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
	null:
	ret
	
endp KeyDetection

;***************************
;@@@@@@@@@@@@@@@@@@@@@@@@@
;***************************

proc MainRectangle
	mov [x], 22 
	mov [y], 110
; --------------------------
	mov cx, 54
MainRectangleRight:
	push cx
	call RectangleRight5X5
	pop cx
	loop MainRectangleRight
; --------------------------
	mov cx, 16
MainRectangleDown:
	push cx
	call RectangleDown5X5
	pop cx
	loop MainRectangleDown
; --------------------------
	mov cx, 53
MainRectangleLeft:
	push cx
	call RectangleLeft5X5
	pop cx
	loop MainRectangleLeft	
; --------------------------
	mov cx, 15
MainRectangleUp:
	push cx
	call RectangleUp5X5
	pop cx
	loop MainRectangleUp
	ret
endp MainRectangle

;***************************
;@@@@@@@@@@@@@@@@@@@@@@@@@

proc ChooseRectangle
	cmp [ChooseRectangleMovement], 0
	jne Option2
	call BlueOption1
	call BlackOption2
	call BlackOption3
	ret
Option2:
	cmp [ChooseRectangleMovement], 1
	jne Option3
	call BlackOption1
	call BlueOption2
	call BlackOption3
	ret
Option3:
	cmp [ChooseRectangleMovement], 2
	jne OptionMax
	call BlackOption1
	call BlackOption2
	call BlueOption3
OptionMax:
	ret
endp ChooseRectangle

;***************************
;***************************

proc BlackOption1

	mov [x], 30
	mov [y], 117
	mov [color], 0
; --------------------------
	mov cx, 19
BlackOption1Right:
	push cx
	call RectangleRight3X3
	pop cx
	loop BlackOption1Right
; --------------------------
	mov cx, 6
BlackOption1Down:
	push cx
	call RectangleDown3X3
	pop cx
	loop BlackOption1Down
; --------------------------
	mov cx, 18
BlackOption1Left:
	push cx
	call RectangleLeft3X3
	pop cx
	loop BlackOption1Left	
; --------------------------
	mov cx, 5
BlackOption1Up:
	push cx
	call RectangleUp3X3
	pop cx
	loop BlackOption1Up
; --------------------------
	ret

endp BlackOption1

;***************************
;***************************

proc BlueOption1
	
	mov [x], 30
	mov [y], 117
	mov [color], 3
; --------------------------
	mov cx, 19
BlueOption1Right:
	push cx
	call RectangleRight3X3
	pop cx
	loop BlueOption1Right
; --------------------------
	mov cx, 6
BlueOption1Down:
	push cx
	call RectangleDown3X3
	pop cx
	loop BlueOption1Down
; --------------------------
	mov cx, 18
BlueOption1Left:
	push cx
	call RectangleLeft3X3
	pop cx
	loop BlueOption1Left	
; --------------------------
	mov cx, 5
BlueOption1Up:
	push cx
	call RectangleUp3X3
	pop cx
	loop BlueOption1Up
; --------------------------
	ret
	
endp BlueOption1

;***************************
;***************************

proc BlackOption2

	mov [x], 30
	mov [y], 141
	mov [color], 0
; --------------------------
	mov cx, 19
BlackOption2Right:
	push cx
	call RectangleRight3X3
	pop cx
	loop BlackOption2Right
; --------------------------
	mov cx, 6
BlackOption2Down:
	push cx
	call RectangleDown3X3
	pop cx
	loop BlackOption2Down
; --------------------------
	mov cx, 18
BlackOption2Left:
	push cx
	call RectangleLeft3X3
	pop cx
	loop BlackOption2Left	
; --------------------------
	mov cx, 5
BlackOption2Up:
	push cx
	call RectangleUp3X3
	pop cx
	loop BlackOption2Up
; --------------------------
	ret

endp BlackOption2

;***************************
;***************************

proc BlueOption2

	mov [x], 30
	mov [y], 141
	mov [color], 3
; --------------------------
	mov cx, 19
BlueOption2Right:
	push cx
	call RectangleRight3X3
	pop cx
	loop BlueOption2Right
; --------------------------
	mov cx, 6
BlueOption2Down:
	push cx
	call RectangleDown3X3
	pop cx
	loop BlueOption2Down
; --------------------------
	mov cx, 18
BlueOption2Left:
	push cx
	call RectangleLeft3X3
	pop cx
	loop BlueOption2Left	
; --------------------------
	mov cx, 5
BlueOption2Up:
	push cx
	call RectangleUp3X3
	pop cx
	loop BlueOption2Up
; --------------------------
	ret

endp BlueOption2

;***************************
;***************************

proc BlackOption3

	mov [x], 30
	mov [y], 165
	mov [color], 0
; --------------------------
	mov cx, 19
BlackOption3Right:
	push cx
	call RectangleRight3X3
	pop cx
	loop BlackOption3Right
; --------------------------
	mov cx, 6
BlackOption3Down:
	push cx
	call RectangleDown3X3
	pop cx
	loop BlackOption3Down
; --------------------------
	mov cx, 18
BlackOption3Left:
	push cx
	call RectangleLeft3X3
	pop cx
	loop BlackOption3Left	
; --------------------------
	mov cx, 5
BlackOption3Up:
	push cx
	call RectangleUp3X3
	pop cx
	loop BlackOption3Up
; --------------------------
	ret

endp BlackOption3

;***************************
;***************************


proc BlueOption3

	mov [x], 30
	mov [y], 165
	
	mov [color], 3
; --------------------------
	mov cx, 19
BlueOption3Right:
	push cx
	call RectangleRight3X3
	pop cx
	loop BlueOption3Right
; --------------------------
	mov cx, 6
BlueOption3Down:
	push cx
	call RectangleDown3X3
	pop cx
	loop BlueOption3Down
; --------------------------
	mov cx, 18
BlueOption3Left:
	push cx
	call RectangleLeft3X3
	pop cx
	loop BlueOption3Left	
; --------------------------
	mov cx, 5
BlueOption3Up:
	push cx
	call RectangleUp3X3
	pop cx
	loop BlueOption3Up
; --------------------------
	ret

endp BlueOption3
;@@@@@@@@@@@@@@@@@@@@@@@@@@
;***************************

;***************************
;@@@@@@@@@@@@@@@@@@@@@@@@@@

proc TPEnter 
	mov dx, offset TEnter
	mov ah, 9h
	int 21h
	ret
endp TPEnter

;***************************
;***************************

proc TPSpace
	mov dx, offset TSpace
	mov ah, 9h
	int 21h
	ret
endp TPSpace

;***************************
;***************************

proc BattelText 
	mov cx , 15
	EnterLoop1:
	call TPEnter
	loop EnterLoop1
; --------------------------
	mov cx, 5
	SpaceLoop1:
	call TPSpace
	loop SpaceLoop1
; --------------------------
	mov dx, offset TAtk
	mov ah, 9h
	int 21h
; --------------------------
	mov cx , 3
	EnterLoop2:
	call TPEnter
	loop EnterLoop2
; --------------------------
	mov cx, 5
	SpaceLoop2:
	call TPSpace
	loop SpaceLoop2
; --------------------------
	mov dx, offset TDef
	mov ah, 9h
	int 21h
; --------------------------
	mov cx , 3
	EnterLoop3:
	call TPEnter
	loop EnterLoop3
; --------------------------
	mov cx, 5
	SpaceLoop3:
	call TPSpace
	loop SpaceLoop3
; --------------------------
	mov dx, offset TFlee
	mov ah, 9h
	int 21h
; --------------------------
	ret
endp BattelText

start:
	mov ax, @data
	mov ds, ax
; --------------------------
	;go to grafic mode
	mov ax, 13h
	int 10h
; --------------------------
	call BattelText
	call MainRectangle
	call ChooseRectangle
; --------------------------
	;wate for key to press
	WaitForData:
	mov [color], 2
	mov ah, 1
	int 16h
	jz WaitForData
; --------------------------
	call KeyDetection
	mov ah, 0 
	int 16h
	jmp WaitForData
; --------------------------
exit:
	mov ax, 4c00h
	int 21h
END start