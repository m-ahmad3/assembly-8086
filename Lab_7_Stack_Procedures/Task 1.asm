.model small
.data
    array1 db 11 ,12,13,14,15
    array2 db 3,2,1,0,5
    array3 db 0,0,0,0,0
.code 
    main proc
      mov ax,@data
      mov ds,ax
      
      mov bx,offset array1
      mov bp,offset array2 
      mov di,offset array3
      
      mov si,0
      
      mov cx,5
      mov ax,0
      
      call sum 
      hlt  
.exit
    main endp
 
 sum proc
    l1:
    mov al,[bx+si]
    add al,[bp+si]
    mov [di],al
    inc si
    inc di
    loop l1
    ret 
 sum endp