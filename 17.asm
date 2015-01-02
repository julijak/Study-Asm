.model small
.stack 256
.data
a1 dw 65h
a2 dw 165h
res dw ?
f db 0
.code
main:
	mov ax, @data
	mov ds, ax 
	xor ax,ax
	mov cx,2
	xor bx,bx
	mov ax,a1
	cmp ax,a2
	ja met
	mov dx,a2
	mov a2,ax
	mov a1,dx
	mov ah,2h
    mov dx,2dh
    int 21h
	clc
met:	 
	xor ax,ax
	mov al,byte ptr a1[bx]
	sub al,f
	mov f,0
	cmp al,byte ptr a2[bx]
	jnb next
	mov f,1
next:
	sub al,byte ptr a2[bx]
	das
	mov byte ptr res[bx],al    
    xor ah,ah 
	inc bx
	loop met
	mov ax,res
	xor cx,cx
	mov bx,10h
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