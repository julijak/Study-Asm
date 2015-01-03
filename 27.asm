; Передать в функцию 2 элемента, перемножить, вернуть результат через стек
.model small
.stack 256
.data
mul1 dw 56
mul2 dw 45
.code
assume ds:@data
main:
	mov ax,@data
	mov ds,ax
	xor ax,ax
	xor dx,dx
	push mul1
	push mul2
	call multiple
	pop ax ; Извлекаем результат
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
multiple proc
	pop cx ; Временно извлекаем адрес возврата
	push bp ; Сохраняем bp
	mov bp,sp ; Помещаем в bp указатель на вершину стека
	mov ax,[bp+2]
	mov bx,[bp+4]
	mul bx
	mov sp,bp
	pop bp ; Извлекаем bp
	pop bx ; Извлекаем параметры
	pop bx ; -//-
	push ax ; Помещаем результат
	push cx ; Сохраняем адрес возврата в вершине
	ret
endp
end
