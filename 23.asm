; Вывести натуральные цифры из строки
.model small
.stack 256
.data
input_msg db 'Input string: $'
buf db ''
.code
assume ds:@data,es:@data
main:
	mov ax,@data
	mov ds,ax
	mov es,ax
	xor cx,cx
	lea dx,input_msg
	mov ah,09h
	int 21h
	lea di,buf
input:
	mov ah,01h
	int 21h
	cmp al,13
	jz output
f_chk:
	cmp al,65 ; A
	jb store ; <65 - save
	cmp al,90 ; Z
	jnb input ; 65<al<90 - A-Z - break
s_chk:
	cmp al,97 ; a
	jb store  ;90<al<97 - save
	cmp al,122 ; z
	jnb input ; 97<al<122 - a-z - break
store:
	stosb ;> 122 - save
	inc cx
	jmp input
output:
	mov al,'$'
	stosb
	lea dx,buf
	mov ah,09h
	int 21h
exit: 
	mov ah,4ch
	int 21h
end
		
	
	