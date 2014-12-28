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
	mov bl,[source+1] ;source length 
	cld
	mov ch,0
load:	
	lodsb
	dec bl
	mov cl,[target+1] ;target length
	lea di,[target+2]		
scan:
	repne scasb
	je load
	mov dl,al
	mov ah,02h
	int 21h	
	cmp bl,0
	jz exit
	jmp load
exit:
	mov ah,4ch
	int 21h
end
