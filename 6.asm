;Сравнить сумму двух первых цифр четырёхзначного числа с суммой двух оставшихся
.model tiny
.data
not_equals_msg db "not equals$"
equals_msg db "equals$"
number dw 5555
.code
assume ds:@data
main:
	mov ax,@data
	mov ds,ax
	xor dx,dx
	mov bx,1000
	mov ax,number
	div bx
	mov cx,ax
	mov ax,dx
	xor dx,dx
	mov bx,100
	div bx
	add cx,ax
	mov ax,dx
	xor dx,dx
	mov bx,10
	div bx
	add ax,dx
	cmp cx,ax
	jne	not_equals
equals:
	lea dx, equals_msg
	jmp print
not_equals:
	lea dx, not_equals_msg
print:
	mov ah,09h
	int 21h
exit:
	mov ah,4ch
	int 21h
end
