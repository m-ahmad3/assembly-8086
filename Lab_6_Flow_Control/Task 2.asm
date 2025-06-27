.model small
.stack 100h
.data 
array1 dw 0x0007,0x0006,0x0005,0x0004,0x0003,0x0002,0x0001,0x001a,0x001b,0x001c,0x001e,0x001d,0x001f,0x0017,0x0016,0x0015,0x0014,0x0013,0x0012,0x0011

.code
mov ax,@data
mov ds,ax
mov dx,19
l1: ;outerloop start

mov cx,dx

mov bx,offset array1
l2: ; innerloop start

mov ax,[bx]
cmp ax,[bx+2]

ja swap
jmp notswap

swap:
xchg ax,[bx+2]
mov [bx],ax 

notswap:
add bx,2


loop l2 ;innerloop end


dec dx
cmp dx,0
jne l1 ;outerloop end 

hlt
.exit
