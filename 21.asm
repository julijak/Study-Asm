; Вывести нечётные элементы строки
.model small
.stack 256
.data
input_msg db 'Please, input string: $'
buf db ?
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
	mov ah,1h ;input element
input:
	int 21h
	cmp al,13 ; Enter
	jz output
	stosb
	inc cx
	jmp input
output:
	lea si,buf
	cld
print:
	lodsb
	mov dl,al
	mov ah,2h
	int 21h
	dec cx
	jcxz exit
	lodsb	
	dec cx
	cmp cx,0
	jne print
exit:
	mov ah,4ch
	int 21h
end
