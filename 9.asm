;Найти максимальную цифру в четырёхзначном числе
.model small
.stack 256
.data
num1 dw 2786
.code
main:
	mov ax,@data	
	mov ds,ax
	xor dx,dx	
	mov bx,10
	mov	ax,num1
	div bx
	mov cx,dx
del:
	xor dx,dx
	div bx
	cmp dx,cx
	ja  replace
	cmp ax,0
	jz print
	jmp del
replace:
	mov cx,dx
	jmp del
print:
	mov dx,cx
	add dx,'0'
	mov ah,02h
int 21h
mov ah,4ch
int 21h
end
