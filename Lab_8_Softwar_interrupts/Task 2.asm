.model small
.stack 100h

.data
var dw 0x12Cf  ; Define a variable with the value 0x12Cf

.code
; Initialize the data segment
mov ax,@data
mov ds,ax

; Load the variable into AX
mov ax,var

; Divide AX by 1000h (4096 in decimal) to get the thousands place
mov cx,1000h
div cx
call champ    ; Convert the result to ASCII
call print    ; Print the character

; Divide the remainder by 100h (256 in decimal) to get the hundreds place
mov cx,100h
div cx
call champ    ; Convert the result to ASCII
call print    ; Print the character

; Divide the remainder by 10h (16 in decimal) to get the tens place
mov cx,10h
div cx
call champ    ; Convert the result to ASCII
call print    ; Print the character

; Divide the remainder by 1h (1 in decimal) to get the ones place
mov cx,1h
div cx
call champ    ; Convert the result to ASCII
call print    ; Print the character

; Halt the processor
hlt

.exit

; Procedure to print the character in BL
print proc
    push ax   ; Save AX register
    push dx   ; Save DX register
    mov dl,bl ; Move the character to DL
    mov ah,02h ; Function to print character in DL
    int 0x21  ; Interrupt 21h to print the character
    pop ax    ; Restore AX register
    pop dx    ; Restore DX register
    mov dx,0h ; Clear DX register
    ret       ; Return from procedure
print endp

; Procedure to convert a binary value in AX to its ASCII representation in BL
champ proc
    ; Move AX to BX for comparison
    mov bx,ax
    cmp bx,09 ; Compare BX with 9
    ja add1   ; If BX > 9, jump to add1
    add bx,30h ; Convert 0-9 to '0'-'9'
    jmp skip  ; Jump to skip
add1:
    add bx,37h ; Convert 10-15 to 'A'-'F'
skip:
    
    ret        ; Return from procedure
champ endp