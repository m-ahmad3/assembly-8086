.model small
.data
.code
mov ax,0x0398
mov bx,0x1f54

mov cx,0xC0F0
MOV dx,0xa12e

mov [0x1000],ax
mov [0x1000+2],bx

mov [0x1010],cx
mov [0x1010+2],dx

add ax,cx
add bx,dx

mov [0x1020],ax
mov [0x1020+2],bx
 
hlt 
.exit
