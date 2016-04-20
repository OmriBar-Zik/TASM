IDEAL
MODEL small
STACK 100h
DATASEG
message db 'ESC key pressed',13,10,'$'
CODESEG
start:
mov ax, @data
mov ds, ax
WaitForData :
in al, 64h ; Read keyboard status port
cmp al, 10b ; Data in buffer ?
je WaitForData ; Wait until data available
in al, 60h ; Get keyboard data
cmp al, 1h ; Is it the ESC key ?
jne WaitForData
ESCPressed:
mov dx, offset message
mov ah, 9
int 21h
exit:
mov ax, 4C00h
int 21h
END start