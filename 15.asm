.model small
.stack 256
.data
	chasn db "chastnoe: $"
	ostat db ", ostatok: $"
	a db 1,4,1
	b db 8
	buf db ?
.code
main:
	mov ax, @data
	mov ds, ax
	mov al, [a+1]
	mov ah, [a+2]
	aad
	div b
	mov buf[0],al
	add buf[0],'0'
	mov al,[a]
	aad
	div b
	mov buf[1],al
	add buf[1],'0'
	mov buf[2],'$'
	mov b,ah
	mov ah, 09h
	lea dx, chasn
	int 21h
	lea dx,buf
	int 21h
	lea dx,ostat
	int 21h
	mov ah,02h
	mov dl,b
	add dl,'0'
	int 21h
	mov ah, 4ch
	int 21h
end