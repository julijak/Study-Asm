; Умножить 2 неупакованных числа
.model small
.stack 256
.data
	ans db 4 dup(0)
	a 	db 7,4,2
	b 	db 8
	len dw 3
.code
main:
	mov ax, @data
	mov ds, ax
	xor bl, bl
	xor si, si
	mov cx, len
lbl:
	mov al, a[si]
	mul b
	aam
	add al, bl
	mov bl, ah
	mov ans[si], al
	inc si
	loop lbl
	mov ans[si], ah
	mov cx, si
	inc cx
	add si, offset ans
zero:
	lodsb
	cmp al, 0
	jne skip
	loop zero
skip:
	mov ah, 02h
	;je print
	mov si, cx
	dec si
print:
	mov dl, ans[si]
	add dl, 30h
	int 21h
	dec si
	jns print
	mov ah, 4ch
	int 21h
end