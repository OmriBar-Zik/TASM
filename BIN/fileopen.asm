IDEAL
MODEL small
STACK 100h
DATASEG
; --------------------------
filename db 'outline',0
; --------------------------
CODESEG
; --------------------------
	proc OpenFile
; Open file
	mov ah, 3Dh
	mov al, 2
	lea dx, [filename]
	int 21h
	jc openerror
	mov [filehandle], ax
	ret
	openerror:
	mov dx, offset ErrorMsg
	mov ah, 9h
	int 21h
	ret
	endp OpenFile
; --------------------------
start:
	mov ax, @data
	mov ds, ax
; --------------------------
	mov ah = 3Dh
	mov al = 2
; --------------------------
	
exit:
	mov ax, 4c00h
	int 21h
END start


