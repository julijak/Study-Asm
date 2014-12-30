;Вывести четырёхзначное число в обратном порядке
.model small
.stack 256
.data
source dw 12345
target dw 200 dup(0)
buf dw ?
.code
assume ds:@data, es:@data
main:
	mov ax,@data
	mov ds,ax
	mov es,ax
	lea di,target
	mov bx,10
	mov ax,source	
	xor cx,cx
del:
	xor dx,dx
	div bx	
	mov buf,ax
	mov ax,dx
	stosw
	inc cx
	mov ax,buf
	cmp ax,0
	jz print
	jmp del
print:
	lea si,target
output:
	lodsw
	mov dx,ax
	add dl,'0'
	mov ah,02h
	int 21h
	loop output
exit:
	mov ah,4ch
	int 21h
end
