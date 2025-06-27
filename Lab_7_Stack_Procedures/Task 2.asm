.model small
.stack 100h

.data
    array db "dorod" 
    length equ $ - array -1  

.code
    mov ax, @data
    mov ds, ax

    mov si, 0  
    mov di, length  

check_palindrome:
    cmp si,di 
    jae found  
                        
    mov al, array[si]  
    mov bl, array[di]  
    cmp al, bl  
    jne notfound  
                      
    inc si  
    dec di  
    jmp check_palindrome  

found:
    mov dl, 1  
    jmp end_program

notfound:
    mov dl, 0  
    jmp end_program

end_program:
   hlt 
   .exit

end
   