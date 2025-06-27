.model small
.stack 100h
.data
.code

;Moving the decimal 150 to both al and bl register
mov al, 150
mov bl, 150

;It will set OF and CF
add al, bl

.exit