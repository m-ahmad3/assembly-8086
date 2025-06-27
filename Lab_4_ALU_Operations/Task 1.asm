.model small
.stack 100h
.data
.code

mov ax, @data
mov ds, ax

;Dividing the 32 bit number into two parts
mov bx, 0x1f54
mov ax, 0x0398

;Doing same as above
mov dx, 0xc0a1
mov cx, 0xf02e

;Moving first number to physical memory
mov [0x1000], ax  
mov [0x1000+2], bx

;Moving second number to physical memory
mov [0x1008], cx 
mov [0x1008+2], dx

;Finding the sum
add ax, cx
adc bx, dx

;Moving the sum to physical memory
mov [0x1010], ax
mov [0x1010+2], bx
             
.exit