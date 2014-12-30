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
	mov bx,10
	xor dx,dx
	xor cx,cx
del:
	div bx
	add cx,dx
	xor dx,dx
	cmp ax,0
	jz next
	jmp del
next:
	mov ax,cx ; sum
	xor cx,cx
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