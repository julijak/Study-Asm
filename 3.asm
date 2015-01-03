; Найти первое вхождение введённого с клавиатуры числа в заданном четырёхзначном числе
.model tiny
.stack 256
.data
number dw 4731
buf db 0
fail_msg db 13,10,"Symbol not found$"
success_msg db 13,10,"Symbol was found at position: $"
input_msg db "Input number to search: $"
.code
assume ds:@data
main:
	mov ax,@data
	mov ds,ax
	mov cx,1
input:
	lea dx,input_msg
	mov ah,09h 
	int 21h
	mov ah,01h ; ввод символа с клавиатуры
	int 21h
	mov buf,al
compare:
	mov ax,number
	mov bx,1000
	xor dx,dx
	div bx
	add al,30h
	cmp al,buf
	je print
	inc cx
	mov ax,dx
	mov bx,100
	xor dx,dx
	div bx
	add al,30h
	cmp al,buf
	je print
	inc cx
	mov ax,dx
	mov bx,10
	xor dx,dx
	div bx
	add al,30h
	cmp al,buf
	je print
	inc cx
	add dl,30h
	cmp dl,buf
	je print
	lea dx,fail_msg
	mov ah,09h
	int 21h
	jmp exit
print: 
	lea dx,success_msg
	mov ah,09h
	int 21h
	mov ah,02h
	mov dx,cx
	add dl,30h
	int 21h
exit:	
	mov ah,4ch
	int 21h
end main