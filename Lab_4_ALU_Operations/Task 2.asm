.model small
.stack 100h
.data
.code

;Initialize the Data segment
mov ax, @data
mov ds, ax

;Moving the values to ax and bx
mov ax, 0x2113
mov bx, 0xff12

;Inverting the bx
neg bx

;Doing the "OR" and "AND operation"
or ax, 0x2340
and ax, 0xabff

;Taking XOR
xor ax, bx

;Moving value to memory to check
mov [0x1000], ax 

hlt

.exit