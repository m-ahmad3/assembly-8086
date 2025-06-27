.model small
.stack 100h

.data
array db 20h,12h,43h,21h,98h ; Define an array of 5 bytes
result db ?                  ; Define a byte to store the result

.code
; Initialize the data segment
mov ax,@data
mov ds,ax

; Clear registers AX, DX, and BX
xor ax,ax
xor dx,dx
xor bx,bx

; Set SI to point to the start of the array
mov si,offset array

; Set CX to the number of elements in the array
mov cx,5

firstloop:
    ; Move the current byte in the array to AL
    mov al,ds:[si]
    
    ; Shift AL right by 4 bits (isolate the high nibble)
    shr al,4
    
    ; Add the high nibble to BL
    add bl,al
    
    ; Increment SI to point to the next byte in the array
    inc si
    
    ; Decrement CX and loop if CX is not zero
    loop firstloop

; Store the result in the result variable
mov result,bl

; Halt the processor
hlt

.exit