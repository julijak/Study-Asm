;Найти символы с максимальным и минимальным ASCII-кодом
.model small
.stack 256
.data
buf db ?
min db 255
max db 0
max_msg db 13,10,'max $'
min_msg db 13,10,'min $'
.code
assume ds:@data
main:
	mov ax,@data	
	mov ds,ax
	xor dx,dx
	xor cx,cx
	mov ah,01h
input:
	int 21h
	cmp al,13
	je  print
	cmp al,min
	jnb cmp_max
	mov min,al
cmp_max:
	cmp al,max
	jna input
	mov max,al
	jmp input
print:
	lea dx,max_msg
	mov ah,09h
	int 21h
	mov dl,max
	mov ah,02h
	int 21h
	lea dx,min_msg
	mov ah,09h
	int 21h
	mov dl,min
	mov ah,02h
	int 21h
	mov ah,4ch
	int 21h
end
