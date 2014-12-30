;Вывести таблицу ASCII-символов с номерами
.model tiny
.stack 256
.code
main:
	mov ch,1 ;пробел
	mov bx,10
output:
	xor dx,dx
	mov dl,ch
	cmp ch,127 ; ~
	je exit
print_symbol:
	mov ah,02h
	int 21h	
	mov dl,09h
	int 21h
	mov cl,0
	mov ah,0
	mov al,ch
print_number:	
	xor dx,dx
	div bx
	push dx
	inc cl
	cmp ax,0
	jnz print_number
	mov ah,02h
print:
	pop dx
	add dl,30h
	int 21h
	dec cl
	cmp cl,0
	jnz print
	xor dx,dx
	mov dl,13
	int 21h
	mov dl,10
	int 21h
	inc ch
	jmp output
exit:
	mov ah,4ch
	int 21h
end main