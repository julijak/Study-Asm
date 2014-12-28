;Сравнить сумму первых двух цифр четырёхзначного числа с суммой последних двух
.model small
.stack 256
.data
more_msg db "more$",13,10
less_msg db "less$",13,10
number dw 5723
.code
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
	jl	less
more:
	lea dx,more_msg
	jmp print
less:
	lea dx,less_msg
print:
	mov ah,09h
	int 21h
	mov ah,4ch
	int 21h
end
