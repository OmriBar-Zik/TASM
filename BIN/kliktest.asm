; -----------------------------------------------------
; Identify key press and key release
; Print "Start" when a key is pressed
; Print "Stop" when the key is released
; Exit program if ESC is pressed
; Barak Gonen 2015
; -----------------------------------------------------
IDEAL
MODEL small
STACK 100h
DATASEG
msg1 db 'Start'$
msg2 db 'Stop'$
saveKey db 0
CODESEG
start:
mov ax, @data
mov ds, ax
WaitForKey:
 ;check if there is a a new key in buffer
in al, 64h
cmp al, 10b
je WaitForKey
in al, 60h
 ;check if ESC key
cmp al, 1
je exit
 ;check if the key is same as already pressed
cmp al, [saveKey]
je WaitForKey
 ;new key- store it
mov [saveKey], al
 ;check if the key was pressed or released
and al, 80h
jnz KeyReleased
KeyPressed:
 ;print "Start"
mov dx, offset msg1
jmp print
KeyReleased:
 ;print "Stop"
mov dx, offset msg2
print:
mov ah, 9h
int 21h
jmp WaitForKey
exit:
mov ax, 4c00h
int 21h
END start
