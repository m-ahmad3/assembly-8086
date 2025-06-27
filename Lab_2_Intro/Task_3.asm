.model small
.stack 100h
.data
.code

mov ax, 0100h
mov bx, 55ABh
mov cx, 0A11h
mov dx, 0001h

add dx, ax
add dx, bx
sub dx, cx


.exit