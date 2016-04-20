IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
tendown db 10 dup (10),' ', 13, 10,'$'
ErrorMsg db 5 dup (10),'            hp','$'
; --------------------------
CODESEG
start:
	mov ax, @data
	mov ds, ax
; --------------------------
	;go to grafic mode
	mov ax, 13h
	int 10h
; --------------------------
;
	mov dx, offset tendown
	mov ah, 9h
	int 21h
	mov dx, offset ErrorMsg
	mov ah, 9h
	int 21h
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