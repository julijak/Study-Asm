; Вывести совпадающие по позиции и значению элементы строки
.model small
.stack 256
.data
input_msg db 13,10,'Please, input string: $'
source db 200,201 dup(0)
target db 200,201 dup(0)
.code
assume ds:@data,es:@data
main:
	mov ax,@data
	mov ds,ax
	mov es,ax
	xor cx,cx
	lea dx,input_msg
	mov ah,09h
	int 21h
	mov ah,0ah
	lea dx,source
	int 21h
	lea si,[source+2]
	xor dx,dx
	lea dx,input_msg
	mov ah,09h
	int 21h
	mov ah,0ah
	lea dx,target
	int 21h
	lea di,[target+2]
	mov dl,10
	mov ah,02h
	int 21h
	mov dl,13
	int 21h
	mov bl,[source+1]
	mov cl,[target+1]
	cld
	cmp bl,cl
	mov ch,0
	jb compare
	mov cl,bl
compare:	
	repne cmpsb
	je save_s
	jcxz exit
	jmp compare
save_s:
	dec si
	lodsb 
	mov ah,02h
	mov dl,al
	int 21h
	jmp compare
exit:
	mov ah,4ch
	int 21h
end
