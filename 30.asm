; Вызвать внешнюю процедуру MessageBox
.386 
.model flat, stdcall 
ExitProcess PROTO      ,:DWORD 
MessageBoxA PROTO      ,:DWORD, :DWORD, :DWORD, :DWORD 
.data 
   MsgBoxCaption  db "Заголовок",0 
   MsgBoxText     db "Текст!",0 
.const 
   NULL        equ  0 
   MB_OK    equ  0
.code 
   Main: 
    INVOKE    MessageBoxA, NULL, ADDR MsgBoxText, ADDR MsgBoxCaption, MB_OK 
    INVOKE    ExitProcess, NULL 
   end Main