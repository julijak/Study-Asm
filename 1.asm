;Найти сумму цифр трёхзначного числа
.model tiny
.stack 256
.data
number dw 346
.code
assume ds:@data
start:
	mov ax,@data
	mov ds,ax
	mov ax,number
	mov bx,100
	xor dx,dx
	div bx
	mov cx,ax
	mov ax,dx
	mov bx,10
	xor dx,dx
	div bx
	add cx,ax
	add cx,dx
	mov ax,cx ;в ax - сумма цифр
	mov cx,0
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
	mov	ah,4ch
	int	21h
end		