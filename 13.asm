; Вычесть 2 неупакованных числа
.model small
.stack 256
.data
	mi 	db "-"
	a	db 4,1,0,7
	b 	db 3,2,1,1
	len	equ $-b
	ans db len dup(0)
.code
main:
	mov ax, @data
	mov ds, ax
	xor ax, ax
	xor si, si
	mov cx, len
	clc
lbl:
	mov al, a[si]
	sbb al, b[si]
	aas
	mov ans[si], al
	inc si
	loop lbl
	jc lbl_
	jmp lbl3
lbl_:
	xor si, si
	mov cx, len
	clc
lbl2:
	mov al, b[si]
	sbb al, a[si]
	aas
	mov ans[si], al
	inc si
	loop lbl2
	mov ah, 02h
	mov dl, mi
	int 21h
lbl3:
	mov cx, si
	add si, offset ans
	std
zero:
	lodsb
	cmp al, 0
	jne skip
	loop zero
skip:
	mov ah, 02h
	je print
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