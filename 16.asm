.model small
.stack 256
.data
a1 dw 99h
a2 dw 199h
res dw ?
sum db 3 dup (0)
.code
main:
	mov ax, @data
	mov ds, ax 
	xor ax,ax
	xor bx,bx
	mov cx,2	
calc:
	mov al, byte ptr a1[bx]
	add al, byte ptr a2[bx]
	daa
	mov byte ptr res[bx],al
	inc bx	
	loop calc
	mov ax,res
	mov bx,10h
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
    mov ah,4ch
    int 21h
end main