IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
; Your variables here
; --------------------------
CODESEG
proc moveLeft ;נקלט המקש a לכן הדמות תזוז שמאלה
	call playerPrintLeftBg ; הפרוצדורה קוראת להדפסת רקע באזור בו היה השחקן לפני התזוזה
	add cx, 2 ; התכנית משנה את cx כדי שייווצר הרושם שהשחקן זז
	push offset c1 ; אני דוחף למחסנית מערך ששומר את המידע על צבעי הפיקסלים של הדמות
	call playerPrintLeft ;והפרוצדורה קוראת לפרוצדורה שמדפיסה את השחקן מחדש
	ret
endp moveLeft

proc playerPrintLeftBg 
	push bp
	mov bp, sp
	sub sp, 4
	mov height, dx
	mov wid, cx
	add height, 16 ;since the character's height is 16px and we want to know when a column is full we will compare dx to the var of the end of the column
	sub wid, 9 ;same thing with the width of the character
columnLoopBg:
	;we'll print each column of the character's line by line and then we'll move to the next one
lineLoopBg:
	mov al, bgColor ; התכנית מדפיסה בפיקסל המתאים בלולאה את צבע הרקע
	mov ah, 0ch
	int 10h
pirntBg:
	inc dx ; עבירה לפיקסל הבא בטור
	cmp dx, height ;checking if the entire column is printed
	jl lineLoopBg
	sub dx, 16
	dec cx
	cmp cx, wid ;checking if the character is fully printed
	jg columnLoopBg
	add cx, 9 ;since we want cx to return to it's original value
	add sp, 4
	pop bp
	ret
endp playerPrintLeftBg

proc playerPrintLeft
	push bp
	mov bp, sp
	sub sp, 4
	mov height, dx
	mov wid, cx
	add height, 16 ;since the character's height is 16px and we want to know when a column is full we will compare dx to the var of the end of the column
	sub wid, 9 ;same thing with the width of the character
	mov si, [bp + 4] ;si will hold the offset of the character's colour arrays
columnLoop:
	;we'll print each column of the character's line by line and then we'll move to the next one
lineLoop:
	mov al, [si]
	cmp al, -1
	je pirntPx
	mov ah, 0ch
	int 10h
pirntPx:
	inc dx
	inc si ;we want the colour of the next pixel
	cmp dx, height ;checking if the entire column is printed
	jl lineLoop
	sub dx, 16
	dec cx
	cmp cx, wid ;checking if the character is fully printed
	jg columnLoop
	add cx, 9 ;since we want cx to return to it's original value
	mov [faceLR], 0
	add sp, 4
	pop bp
	ret 2
endp playerPrintLeft


start:
	mov ax, @data
	mov ds, ax
; --------------------------
; Your code here
; --------------------------
	
exit:
	mov ax, 4c00h
	int 21h
END start