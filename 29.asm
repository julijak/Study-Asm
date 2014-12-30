; Передать в функцию 3 элемента, сложить 1 и 3, вернуть результат через общую область памяти
.model small
.stack 256
common_data segment para common "data"
result dw ?
common_data ends
.data 
.code
assume ds:common_data
main:
	mov ax,@data
	mov ds,ax
	xor dx,dx
	xor ax,ax
	push 56
	push 45
	push 11
	call sum
	mov ax,result
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
	add ax,[bp+8]
	mov sp,bp
	pop bp	
	mov result,ax
	ret
endp
end
