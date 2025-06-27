.model small
.stack 100h
.data

array1 db 9,8,7,6,3,4,3,2,1,2,3,4,5,3,7,3,9,3,2,1
num db 3 ;to check number of occurencies

.code

mov ax,@data
mov ds,ax
mov di,offset array1
mov dl,num
mov ax,0
mov cx,20

L1: ;Loop Start
cmp dl,[di]
je increment

back: 
inc di

loop L1 ;loop end 

hlt
.exit

increment:
inc ax
jmp back

