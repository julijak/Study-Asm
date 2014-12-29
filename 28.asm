; Передать в функцию 2 элемента, сложить, вернуть результат через регистр
.model small
.stack 256
.data
num1 dw 56
num2 dw 45
.code
assume ds:@data
main:
	mov ax,@data
	mov ds,ax
	xor ax,ax
	xor dx,dx
	push num1
	push num2
	call sum
	xor cx,cx
	mov bx,10
divide: ;вывод числа
	xor dx,dx
	div bx
	push dx
	inc cx
	cmp ax,0
	jnz divide
	mov ah,02h
print:
	pop dx
	add dx,30h
	int 21h
	loop print
exit:
	mov ah,4ch
	int 21h
sum proc
	push bp
	mov bp,sp
	mov ax,[bp+4]
	add ax,[bp+6]
	mov sp,bp
	pop bp	
	ret
endp
end
