;Rectangle
IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
;paint dot sessions
x dw 160
y dw 100
color db 2
; --------------------------
;attack's screen
ChooseRectangleMovementMain dw 0
ChooseRectangleMovement_ATK dw 0
Layer db 0
ATK_Layer db 0 
; --------------------------
;special text
TEnter      db  10,13,  '$'
TSpace      db  ':',    '$'
; --------------------------
;stast text
TAtk        db  'ATK',  '$'
TDef        db  'DEF',  '$'
TFlee       db  'FLEE', '$'
; --------------------------
;attack text
HeavyAttack     db  'HEAVY ATK',        '$'
NormalAttack    db  'NORMAL ATK',   '$'
QuickAttack     db  'QUICK ATK',        '$'
BACK            DB  17,'BACK',          '$'

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
;Rectangles 5X5

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
; --------------------------
	cmp Layer, 0
	jne ChooseRectangleMovement_ATK_Up
; --------------------------
    ;check if ChooseRectangleMovementMain < 2
    ;if ChooseRectangleMovementMain < 2
    cmp [ChooseRectangleMovementMain], 2
    ;jamp to IncChooseRectangleMovement
    jl IncChooseRectangleMovement
; --------------------------
    ;else jamp to FIncChooseRectangleMovement
    jmp FIncChooseRectangleMovement
; --------------------------
    ;increases ChooseRectangleMovementMain and calls ChooseRectangle
IncChooseRectangleMovement:
    inc [ChooseRectangleMovementMain]
    call ChooseRectangle
FIncChooseRectangleMovement:
; --------------------------
    ret
; --------------------------
ChooseRectangleMovement_ATK_Up:

    cmp [ChooseRectangleMovementMain_ATK], 0
	jne FIncChooseRectangleMovement_ATK
	cmp [ChooseRectangleMovementMain_ATK], 1
	jne FIncChooseRectangleMovement_ATK
    jl IncChooseRectangleMovement_AKT
	cmp [ChooseRectangleMovementMain_ATK], 5
	jl 
; --------------------------
    ;else jamp to FIncChooseRectangleMovement
    jmp FIncChooseRectangleMovement_ATK
; --------------------------
    ;increases ChooseRectangleMovementMain and calls ChooseRectangle
IncChooseRectangleMovement__ATK:
    inc [ChooseRectangleMovement_ATK]
    call ChooseRectangle
FIncChooseRectangleMovement_ATK:
; --------------------------
    ret
; --------------------------
	
	
	
	
endp ChooseRectangleMovementUp

;***************************
;***************************

proc ChooseRectangleMovementdown
; --------------------------
    ;check if ChooseRectangleMovementMain > 0
    ;jamp to DecChooseRectangleMovement
    cmp [ChooseRectangleMovementMain], 0
    jg DecChooseRectangleMovement
; --------------------------
    ;else jmp to FDecChooseRectangleMovement
    jmp FDecChooseRectangleMovement
; --------------------------
    ;decreases ChooseRectangleMovementMain and calls ChooseRectangle
DecChooseRectangleMovement:
    dec [ChooseRectangleMovementMain]
    call ChooseRectangle
; --------------------------
    ret
; --------------------------
endp ChooseRectangleMovementdown

;***************************
;***************************

proc EnterCheker
; --------------------------
    ;check if the Rectangle is in the first position
    cmp [ChooseRectangleMovementMain], 0
    jne Option2Choose
    call EnterATK
    mov bx, [ChooseRectangleMovementMain]
    ;mov [SafeLayer], bx
    ret
; --------------------------
    ;check if the Rectangle is in the second position
Option2Choose:
    cmp [ChooseRectangleMovementMain], 1
    jne Option3Choose
    ;call EnterDEF
    ret
; --------------------------
    ;check if the Rectangle is in the third position
Option3Choose:
    cmp [ChooseRectangleMovementMain], 2
    jne OptionMaxChoose
    ;call EnterFLEE
OptionMaxChoose:
    ret
; --------------------------
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
    cmp ah, 1Ch
    jne escp
    call EnterCheker
    ret
; --------------------------
escp:
    ;Detect esc
    cmp ah, 1h
    jne null
; --------------------------
    ;go to text mode
    mov ah, 0
    mov al, 2
    int 10h
; --------------------------
    ;exit from progrm
    mov ah, 4Ch
    int 21h
    null:
; --------------------------
    ret
; --------------------------
endp KeyDetection

;***************************
;@@@@@@@@@@@@@@@@@@@@@@@@@
;***************************

proc MainRectangle
    mov [x], 22
    mov [y], 110
; --------------------------
    ;create line 5x270 pixsels
    mov cx, 54
MainRectangleRight:
    push cx
    call RectangleRight5X5
    pop cx
    loop MainRectangleRight
; --------------------------
    ;create line 5x80
    mov cx, 16
MainRectangleDown:
    push cx
    call RectangleDown5X5
    pop cx
    loop MainRectangleDown
; --------------------------
    ;create line 5x265
    mov cx, 53
MainRectangleLeft:
    push cx
    call RectangleLeft5X5
    pop cx
    loop MainRectangleLeft
; --------------------------
    ;create line 5x75
    mov cx, 15
MainRectangleUp:
    push cx
    call RectangleUp5X5
    pop cx
    loop MainRectangleUp
; --------------------------
    ret
endp MainRectangle

;***************************
;@@@@@@@@@@@@@@@@@@@@@@@@@

proc ChooseRectangle
; --------------------------
    ;paint 1 blue Rectangle in the top section and 2 black Rectangle in the middle and the bottom
    ;if ChooseRectangleMovementMain = 0
    cmp [ChooseRectangleMovementMain], 0
    jne Option2
    call BlueOption1
    call BlackOption2
    call BlackOption3
; --------------------------
    ret
; --------------------------
    ;paint 1 blue Rectangle in the middle section and 2 black Rectangle in the top and the bottom
    ;if ChooseRectangleMovementMain = 1
Option2:
    cmp [ChooseRectangleMovementMain], 1
    jne Option3
    call BlackOption1
    call BlueOption2
    call BlackOption3
; --------------------------
    ret
; --------------------------
    ;paint 1 blue Rectangle in the bottom section and 2 black Rectangle in the top and the middle
    ;if ChooseRectangleMovementMain = 2
Option3:
    cmp [ChooseRectangleMovementMain], 2
    jne OptionMax
    call BlackOption1
    call BlackOption2
    call BlueOption3
; --------------------------
    ret
; --------------------------
OptionMax:
; --------------------------
	ret
; --------------------------

endp ChooseRectangle

;***************************
;***************************

proc ChooseRectangle_ATK
    cmp [ChooseRectangleMovement_ATK], 3
    jne Option5
    call BlueOption4
    call BlackOption5
    call BlackOption6
    call BlackOption7
; --------------------------
    ret
; --------------------------
Option5:
    cmp [ChooseRectangleMovement_ATK], 4
    jne Option6
    call BlackOption4
    call BlueOption5
    call BlackOption6
    call BlackOption7
; --------------------------
; --------------------------
Option6:
    cmp [ChooseRectangleMovement_ATK], 5
    jne Option7
    call BlackOption4
    call BlackOption5
    call BlueOption6
    call BlackOption7
; --------------------------
    ret
; --------------------------
Option7:
    cmp [ChooseRectangleMovement_ATK], 6
    jne OptionMax
    call BlackOption4
    call BlackOption5
    call BlackOption6
    call BlueOption7
; --------------------------
    ret
; --------------------------
ATK_OptionMax:
; --------------------------
    ret
; --------------------------
endp ChooseRectangle_ATK


;***************************
;***************************

proc BlackOption1
    ;seting the stating point
    mov [x], 30
    mov [y], 117
    mov [color], 0
; --------------------------
    ;create line 3x45 towards right
    mov cx, 15
BlackOption1Right:
    push cx
    call RectangleRight3X3
    pop cx
    loop BlackOption1Right
; --------------------------
    ;create line 3x18 towards down
    mov cx, 6
BlackOption1Down:
    push cx
    call RectangleDown3X3
    pop cx
    loop BlackOption1Down
; --------------------------
    ;create line 3x42 towards left
    mov cx, 14
BlackOption1Left:
    push cx
    call RectangleLeft3X3
    pop cx
    loop BlackOption1Left
; --------------------------
    ;create line 3x15 towards up
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
    ;seting the stating point
    mov [x], 30
    mov [y], 117
    mov [color], 4
; --------------------------
    ;create line 3x45 towards right
    mov cx, 15
BlueOption1Right:
    push cx
    call RectangleRight3X3
    pop cx
    loop BlueOption1Right
; --------------------------
    ;create line 3x18 towards down
    mov cx, 6
BlueOption1Down:
    push cx
    call RectangleDown3X3
    pop cx
    loop BlueOption1Down
; --------------------------
    ;create line 3x15 towards left
    mov cx, 14
BlueOption1Left:
    push cx
    call RectangleLeft3X3
    pop cx
    loop BlueOption1Left
; --------------------------
    ;create line 3x15 towardsup
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
    ;seting the stating point
    mov [x], 30
    mov [y], 141
    mov [color], 0
; --------------------------
    ;create line 3x45 towards right
    mov cx, 15
BlackOption2Right:
    push cx
    call RectangleRight3X3
    pop cx
    loop BlackOption2Right
; --------------------------
    ;create line 3x18 towards down
    mov cx, 6
BlackOption2Down:
    push cx
    call RectangleDown3X3
    pop cx
    loop BlackOption2Down
; --------------------------
    ;create line 3x15 towards left
    mov cx, 14
BlackOption2Left:
    push cx
    call RectangleLeft3X3
    pop cx
    loop BlackOption2Left
; --------------------------
    ;create line 3x15 towards up
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
    ;seting the stating point
    mov [x], 30
    mov [y], 141
    mov [color], 3
; --------------------------
    ;create line 3x45 towards right
    mov cx, 15
BlueOption2Right:
    push cx
    call RectangleRight3X3
    pop cx
    loop BlueOption2Right
; --------------------------
    ;create line 3x18 towards down
    mov cx, 6
BlueOption2Down:
    push cx
    call RectangleDown3X3
    pop cx
    loop BlueOption2Down
; --------------------------
    ;create line 3x15 towards left
    mov cx, 14
BlueOption2Left:
    push cx
    call RectangleLeft3X3
    pop cx
    loop BlueOption2Left
; --------------------------
    ;create line 3x15 towards up
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
    ;seting the stating point
    mov [x], 30
    mov [y], 165
    mov [color], 0
; --------------------------
    ;create line 3x45 towards right
    mov cx, 15
BlackOption3Right:
    push cx
    call RectangleRight3X3
    pop cx
    loop BlackOption3Right
; --------------------------
    ;create line 3x18 towards down
    mov cx, 6
BlackOption3Down:
    push cx
    call RectangleDown3X3
    pop cx
    loop BlackOption3Down
; --------------------------
    ;create line 3x15 towards left
    mov cx, 14
BlackOption3Left:
    push cx
    call RectangleLeft3X3
    pop cx
    loop BlackOption3Left
; --------------------------
    ;create line 3x15 towards up
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
    ;seting the stating point
    mov [x], 30
    mov [y], 165
    mov [color], 3
; --------------------------
    ;create line 3x45 towards right
    mov cx, 15
BlueOption3Right:
    push cx
    call RectangleRight3X3
    pop cx
    loop BlueOption3Right
; --------------------------
    ;create line 3x18 towards down
    mov cx, 6
BlueOption3Down:
    push cx
    call RectangleDown3X3
    pop cx
    loop BlueOption3Down
; --------------------------
    ;create line 3x15 towards left
    mov cx, 14
BlueOption3Left:
    push cx
    call RectangleLeft3X3
    pop cx
    loop BlueOption3Left
; --------------------------
    ;create line 3x15 towards up
    mov cx, 5
BlueOption3Up:
    push cx
    call RectangleUp3X3
    pop cx
    loop BlueOption3Up
; --------------------------
    ret
endp BlueOption3

;***************************
;***************************

proc BlueOption4
    ;seting the stating point
    mov [x], 90
    mov [y], 153
    mov [color], 3
; --------------------------
    ;create line 3x45 towards right
    mov cx, 16
BlueOption4Right:
    push cx
    call RectangleRight3X3
    pop cx
    loop BlueOption4Right
; --------------------------
    ;create line 3x18 towards down
    mov cx, 6
BlueOption4Down:
    push cx
    call RectangleDown3X3
    pop cx
    loop BlueOption4Down
; --------------------------
    ;create line 3x15 towards left
    mov cx, 15
BlueOption4Left:
    push cx
    call RectangleLeft3X3
    pop cx
    loop BlueOption4Left
; --------------------------
    ;create line 3x15 towards up
    mov cx, 5
BlueOption4Up:
    push cx
    call RectangleUp3X3
    pop cx
    loop BlueOption4Up
; --------------------------
    ret
endp BlueOption4

;***************************
;***************************

proc BlackOption4
    ;seting the stating point
    mov [x], 90
    mov [y], 153
    mov [color], 3
; --------------------------
    ;create line 3x45 towards right
    mov cx, 16
BlackOption4Right:
    push cx
    call RectangleRight3X3
    pop cx
    loop BlackOption4Right
; --------------------------
    ;create line 3x18 towards down
    mov cx, 6
BlackOption4Down:
    push cx
    call RectangleDown3X3
    pop cx
    loop BlackOption4Down
; --------------------------
    ;create line 3x15 towards left
    mov cx, 15
BlackOption4Left:
    push cx
    call RectangleLeft3X3
    pop cx
    loop BlackOption4Left
; --------------------------
    ;create line 3x15 towards up
    mov cx, 5
BlackOption4Up:
    push cx
    call RectangleUp3X3
    pop cx
    loop BlackOption4Up
; --------------------------
    ret
endp BlackOption4

;***************************
;***************************

proc BlueOption5
    ;seting the stating point
    mov [x], 157
    mov [y], 130
    mov [color], 3
; --------------------------
    ;create line 3x15 towards left
    mov cx, 27
BlueOption5Left:
    push cx
    call RectangleLeft3X3
    pop cx
    loop BlueOption5Left
; --------------------------
    ;create line 3x18 towards down
    mov cx, 6
BlueOption5Down:
    push cx
    call RectangleDown3X3
    pop cx
    loop BlueOption5Down
; --------------------------
    ;create line 3x45 towards right
    mov cx, 26
BlueOption5Right:
    push cx
    call RectangleRight3X3
    pop cx
    loop BlueOption5Right
    ; --------------------------
    ;create line 3x15 towards up
    mov cx, 5
BlueOption5Up:
    push cx
    call RectangleUp3X3
    pop cx
    loop BlueOption5Up
; --------------------------
    ret
endp BlueOption5

;***************************
;***************************

proc BlackOption5
    ;seting the stating point
    mov [x], 157
    mov [y], 130
    mov [color], 3
; --------------------------
    ;create line 3x15 towards left
    mov cx, 27
BlackOption5Left:
    push cx
    call RectangleLeft3X3
    pop cx
    loop BlackOption5Left
; --------------------------
    ;create line 3x18 towards down
    mov cx, 6
BlackOption5Down:
    push cx
    call RectangleDown3X3
    pop cx
    loop BlackOption5Down
; --------------------------
    ;create line 3x45 towards right
    mov cx, 26
BlackOption5Right:
    push cx
    call RectangleRight3X3
    pop cx
    loop BlackOption5Right
    ; --------------------------
    ;create line 3x15 towards up
    mov cx, 5
BlackOption5Up:
    push cx
    call RectangleUp3X3
    pop cx
    loop BlackOption5Up
; --------------------------
    ret
endp BlackOption5

;***************************
;***************************

proc BlueOption6
    ;seting the stating point
    mov [x], 270
    mov [y], 130
    mov [color], 3
; --------------------------
    ;create line 3x15 towards left
    mov cx, 30
BlueOption6Left:
    push cx
    call RectangleLeft3X3
    pop cx
    loop BlueOption6Left
; --------------------------
    ;create line 3x18 towards down
    mov cx, 6
BlueOption6Down:
    push cx
    call RectangleDown3X3
    pop cx
    loop BlueOption6Down
; --------------------------
    ;create line 3x45 towards right
    mov cx, 29
BlueOption6Right:
    push cx
    call RectangleRight3X3
    pop cx
    loop BlueOption6Right
    ; --------------------------
    ;create line 3x15 towards up
    mov cx, 5
BlueOption6Up:
    push cx
    call RectangleUp3X3
    pop cx
    loop BlueOption6Up
; --------------------------
    ret
endp BlueOption6

;***************************
;***************************

proc BlackOption6
    ;seting the stating point
    mov [x], 270
    mov [y], 130
    mov [color], 3
; --------------------------
    ;create line 3x15 towards left
    mov cx, 30
BlackOption6Left:
    push cx
    call RectangleLeft3X3
    pop cx
    loop BlackOption6Left
; --------------------------
    ;create line 3x18 towards down
    mov cx, 6
BlackOption6Down:
    push cx
    call RectangleDown3X3
    pop cx
    loop BlackOption6Down
; --------------------------
    ;create line 3x45 towards right
    mov cx, 29
BlackOption6Right:
    push cx
    call RectangleRight3X3
    pop cx
    loop BlackOption6Right
    ; --------------------------
    ;create line 3x15 towards up
    mov cx, 5
BlackOption6Up:
    push cx
    call RectangleUp3X3
    pop cx
    loop BlackOption6Up
; --------------------------
    ret
endp BlackOption6

;***************************
;***************************

proc BlueOption7
    ;seting the stating point
    mov [x], 261
    mov [y], 154
    mov [color], 3
; --------------------------
    ;create line 3x15 towards left
    mov cx, 27
BlueOption7Left:
    push cx
    call RectangleLeft3X3
    pop cx
    loop BlueOption7Left
; --------------------------
    ;create line 3x18 towards down
    mov cx, 6
BlueOption7Down:
    push cx
    call RectangleDown3X3
    pop cx
    loop BlueOption7Down
; --------------------------
    ;create line 3x45 towards right
    mov cx, 26
BlueOption7Right:
    push cx
    call RectangleRight3X3
    pop cx
    loop BlueOption7Right
    ; --------------------------
    ;create line 3x15 towards up
    mov cx, 5
BlueOption7Up:
    push cx
    call RectangleUp3X3
    pop cx
    loop BlueOption7Up
; --------------------------
    ret
endp BlueOption7

;***************************
;***************************

proc BlackOption7
    ;seting the stating point
    mov [x], 261
    mov [y], 154
    mov [color], 3
; --------------------------
    ;create line 3x15 towards left
    mov cx, 27
BlackOption7Left:
    push cx
    call RectangleLeft3X3
    pop cx
    loop BlackOption7Left
; --------------------------
    ;create line 3x18 towards down
    mov cx, 6
BlackOption7Down:
    push cx
    call RectangleDown3X3
    pop cx
    loop BlackOption7Down
; --------------------------
    ;create line 3x45 towards right
    mov cx, 26
BlackOption7Right:
    push cx
    call RectangleRight3X3
    pop cx
    loop BlackOption7Right
    ; --------------------------
    ;create line 3x15 towards up
    mov cx, 5
BlackOption7Up:
    push cx
    call RectangleUp3X3
    pop cx
    loop BlackOption7Up
; --------------------------
    ret
endp BlackOption7



;@@@@@@@@@@@@@@@@@@@@@@@@@@
;***************************

;***************************
;@@@@@@@@@@@@@@@@@@@@@@@@@@

proc TPEnter
    ;print enter in the screen / pushing the text up  a line
    mov dx, offset TEnter
    mov ah, 9h
    int 21h
    ret
endp TPEnter

;***************************
;***************************

proc TPSpace
    ;PRINT space on the screen / go right once
    mov dx, offset TSpace
    mov ah, 9h
    int 21h
    ret
endp TPSpace

;***************************
;***************************

proc ClearScreenText
    ;clear the text from the screen
    mov cx, 30
    ClearScreenTextloop:
    call TPEnter
    loop ClearScreenTextloop
    ret
endp ClearScreenText

;***************************
;***************************

proc StartBattelText
    ;print the text on the scean
    call ClearScreenText
; --------------------------
    ;5 times space
    mov cx, 5
    SpaceLoop1:
    call TPSpace
    loop SpaceLoop1
; --------------------------
    ;print "ATK" on the screen
    mov dx, offset TAtk
    mov ah, 9h
    int 21h
; --------------------------
    ;pushing the text up 3 times
    call TPEnter
    call TPEnter
    call TPEnter
; --------------------------
    ;5 times space
    mov cx, 5
    SpaceLoop2:
    call TPSpace
    loop SpaceLoop2
; --------------------------
    ;print "DEF" on the screen
    mov dx, offset TDef
    mov ah, 9h
    int 21h
; --------------------------
    ;pushing the text up 3 times
    call TPEnter
    call TPEnter
    call TPEnter
; --------------------------
    ;5 times space
    mov cx, 5
    SpaceLoop3:
    call TPSpace
    loop SpaceLoop3
; --------------------------
    ;print "FLEE" on the screen
    mov dx, offset TFlee
    mov ah, 9h
    int 21h
; --------------------------
    ;pushing the text up 3 times
    call TPEnter
    call TPEnter
    call TPEnter
; --------------------------
    ret
endp StartBattelText

;***************************
;***************************

proc EnterATK
; --------------------------
    ;go to ClearScreenText
    call ClearScreenText
; --------------------------
    ;SPACE x 5
    mov cx, 5
    SpaceLoop4:
    call TPSpace
    loop SpaceLoop4
; --------------------------
    ;writing on the screen ATK
    mov dx, offset TAtk
    mov ah, 9h
    int 21h
; --------------------------
    ;ENTER x 2
    call TPEnter
    call TPEnter
; --------------------------
    ;SPACE x 10
    mov cx, 10
    SpaceLoop5:
    call TPSpace
    loop SpaceLoop5
; --------------------------
    ;writing on the screen HEAVY ATTACK
    mov dx, offset HeavyAttack
    mov ah, 9h
    int 21h
; --------------------------
    ;SPACE x 4
    mov cx, 4
    SpaceLoop6:
    call TPSpace
    loop SpaceLoop6
; --------------------------
    ;writing on the screen NORMAL ATTACK
    mov dx, offset NormalAttack
    mov ah, 9h
    int 21h
; --------------------------
    ;pushing the text up 1 time
    call TPEnter
; --------------------------
    ;SPACE x 5
    mov cx, 5
    SpaceLoop7:
    call TPSpace
    loop SpaceLoop7
; --------------------------
    ;print "DEF" on the screen
    mov dx, offset TDef
    mov ah, 9h
    int 21h
; --------------------------
    ;pushing the text up 2 times
    call TPEnter
    call TPEnter
; --------------------------
    ;SPACE x 8
    mov cx, 12
    SpaceLoop8:
    call TPSpace
    loop SpaceLoop8
; --------------------------
    ;print "BACK" on the screen
    mov dx, offset BACK
    mov ah, 9h
    int 21h
; --------------------------
    ;space 6 times
    mov cx, 6
    SpaceLoop9:
    call TPSpace
    loop SpaceLoop9
; --------------------------
    ;print "QUICK ATK" on the screen
    mov dx, offset QuickAttack
    mov ah, 9h
    int 21h
; --------------------------
    ;pushing the text up 1 time
    call TPEnter
; --------------------------
    ;space 5 times
    mov cx, 5
    SpaceLoop10:
    call TPSpace
    loop SpaceLoop10
; --------------------------
    ;print "FLEE" on the screen
    mov dx, offset TFLEE
    mov ah, 9h
    int 21h
; --------------------------
    ;push the text up 3 times
    call TPEnter
    call TPEnter
    call TPEnter
; --------------------------
    call MainRectangle
    ret
endp EnterATK

;***************************
;***************************

proc checker
    cmp [ChooseRectangleMovementMain], 2
    jg problem_1
    jmp NoProblem_1
problem_1:


NoProblem_1:
    cmp [ChooseRectangleMovementMain], 0
    jl problem


    jmp checkerexit
problem:


    ret
checkerexit:
    ret
endp checker

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
    ;calling to the starting procedure
    call StartBattelText
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
    ;calls procedure that checks when key press on the keybord
    call KeyDetection
; --------------------------
    ;call checker
; --------------------------
    ;reset ah, to clean the buffer
    mov ah, 0
    int 16h
    jmp WaitForData
; --------------------------
exit:
    mov ax, 4c00h
    int 21h
END start