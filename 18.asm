.model small
stack 256
.data
input_msg_str db 'Please, input string: $'
input_msg db 'input symbol: $'
output_msg db 13,10,'number of inclusions: $'
string db 200,201 dup(0)
.code
assume ds:@data,es:@data
main:
	mov ax,@data
	mov ds,ax
	mov es,ax
	lea dx,input_msg_str
	mov ah,09h
	int 21h
	mov ah,0ah
	lea dx, string
	int 21h
	mov ah,2h
	mov dl,13
	int 21h
	mov dl,10
	int 21h
	mov ah,9h
	lea dx,input_msg
	int 21h
	mov ah,1
	int 21h
	lea di,[string+2]
	mov cl,[string+1]
	mov ch,0
	inc cl
	xor bx,bx
scan:
	repne	scasb
	jcxz exit
	jne scan
	inc bx
	jmp scan
exit: 
	lea dx,output_msg
	mov ah,9h
	int 21h
	add bx,'0'
	mov dx,bx
	mov ah,2h
	int 21h
	mov ah,4ch
	int 21h
end
