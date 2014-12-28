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
	cmp al,48 ; 0
	jb input
	cmp al,57 ; 9
	ja input
	stosb
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
		
	
	