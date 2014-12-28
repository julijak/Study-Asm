;Вывести число в обратном порядке
.model small
.stack 256
.data
num1 dw 1234
.code
assume ds:@data
main:
	mov ax,@data
	mov ds,ax
	mov bx,1000
	mov ax,num1
	xor dx,dx
	div bx
	push ax
	mov ax,dx
	mov dx,0
	mov bx,100
	div bx
	push ax
	mov ax,dx
	mov dx,0
	mov bx,10
	div bx
	push ax
	push dx
	mov cx,4
output:
	pop dx
	add dl,'0'
	mov ax,0200h
	int 21h
	loop output
exit:
	mov ah,4ch
	int 21h
end
