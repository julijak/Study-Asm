;Найти максимальную цифру в четырёхзначном числе
.model small
.stack 256
.data
num1 dw 7760
buf dw ?
.code
main:
	mov ax,@data	
	mov ds,ax
	xor dx,dx
	mov bx,1000
	mov	ax,num1
	div bx
	mov buf,ax
	mov ax,dx
	mov dx,0
	mov bx,100
	div bx
	cmp ax,buf
	jb  step2
	mov buf,ax
step2:
	mov ax,dx
	mov dx,0
	mov bx,10
	div bx
	cmp ax,buf
	jb 	step3
	mov buf,ax
step3:
	cmp dx,buf
	jb print
	mov buf,dx
print:
	mov dx,buf
	add dx,'0'
	mov ah,02h
int 21h
mov ah,4ch
int 21h
end
