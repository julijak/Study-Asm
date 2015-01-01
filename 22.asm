; Вывести строку в упорядоченном виде
.model small
.stack 256
.data
input_msg db 13,10,'Please, input string: $'
source db 200,201 dup(0)
.code
assume ds:@data,es:@data
main:
	mov ax,@data
	mov ds,ax
	xor cx,cx
	xor dx,dx
	lea dx,input_msg
	mov ah,09h
	int 21h
	mov ah,0ah
	lea dx,source
	int 21h
	xor dx,dx
	mov dl,10
	mov ah,02h
	int 21h
	mov dl,13
	int 21h
	cld
	xor ax,ax
	mov bx,-1
cycle:
	lea si,[source+2]
	mov cl,[source+1]
	inc bx
	cmp bx,255
	je exit
compare:
	lodsb
	cmp al,bl
	je print
	dec cx
	jcxz cycle
	jmp compare
print:
	mov ah,02h
	mov dl,al
	int 21h
	jmp compare
exit:
	mov ah,4ch
	int 21h
end
