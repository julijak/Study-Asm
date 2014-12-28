.model small
.stack
.data
sum     db      5 dup(0)
first   db      1, 9, 5, 1
second  db      3, 1, 5, 0
len     equ     $-second
.code
start:
    mov ax, @data
    mov ds, ax
	xor ax, ax
    xor si, si
    mov cx, len 
op:
    mov al, first[si]
    adc al, second[si]
    aaa
    mov sum[si], al
    inc si
    loop op	
    adc sum[si], 0 
    mov cx, si
    inc cx
    add si, offset sum
    std 
zero:
    lodsb
    test al, al
    jnz skip
    loop zero 
skip:
    mov ah, 2
    mov si, cx
    jz next
    dec si 
next:
    mov dl, sum[si]
    add dl, 30h
    int 21h
    dec si
    jns next
	mov ax, 4c00h
    int 21h
end start