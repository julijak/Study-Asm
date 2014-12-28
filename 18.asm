.model small
stack 256
.data
string db 'this is test string$'
str_ln dw $-string
input_msg db 'input symbol: $'
output_msg db 13,10,'number of inclusions: $'
.code
assume ds:@data,es:@data
main:
mov ax,@data
mov ds,ax
mov es,ax
lea dx,input_msg
mov ah,9h
int 21h
mov ah,1
int 21h
lea di,string
mov cx,str_ln
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
