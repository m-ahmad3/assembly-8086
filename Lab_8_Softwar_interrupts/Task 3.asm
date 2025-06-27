.model small
.stack 100h

.data
VAR1 DW ?       ; Declare VAR1 as a word (2 bytes) variable
VAR2 DW ?       ; Declare VAR2 as a word (2 bytes) variable
RESULT DW ?     ; Declare RESULT as a word (2 bytes) variable

.code
; Initialize the data segment
mov ax,@data
mov ds,ax

; Clear AX register
xor ax,ax

; Read first character
mov ah,0x1           ; Function to read a character from standard input
int 0x21             ; Interrupt 21h to read character
call champ           ; Call the 'champ' procedure to convert character
ADD BH,AL            ; Add the result to BH
SHL BH,4             ; Shift BH left by 4 bits

; Read second character
xor ax,ax            ; Clear AX register
mov ah,0x1           ; Function to read a character from standard input
int 0x21             ; Interrupt 21h to read character
call champ           ; Call the 'champ' procedure to convert character
ADD BH,AL            ; Add the result to BH

; Read third character
xor ax,ax            ; Clear AX register
mov ah,0x1           ; Function to read a character from standard input
int 0x21             ; Interrupt 21h to read character
call champ           ; Call the 'champ' procedure to convert character
ADD BL,AL            ; Add the result to BL
SHL BL,4             ; Shift BL left by 4 bits

; Read fourth character
xor ax,ax            ; Clear AX register
mov ah,0x1           ; Function to read a character from standard input
int 0x21             ; Interrupt 21h to read character
call champ           ; Call the 'champ' procedure to convert character
ADD BL,AL            ; Add the result to BL

; Read fifth character
xor ax,ax            ; Clear AX register
mov ah,0x1           ; Function to read a character from standard input
int 0x21             ; Interrupt 21h to read character
call champ           ; Call the 'champ' procedure to convert character
ADD DH,AL            ; Add the result to DH
SHL DH,4             ; Shift DH left by 4 bits

; Read sixth character
xor ax,ax            ; Clear AX register
mov ah,0x1           ; Function to read a character from standard input
int 0x21             ; Interrupt 21h to read character
call champ           ; Call the 'champ' procedure to convert character
ADD DH,AL            ; Add the result to DH

; Read seventh character
xor ax,ax            ; Clear AX register
mov ah,0x1           ; Function to read a character from standard input
int 0x21             ; Interrupt 21h to read character
call champ           ; Call the 'champ' procedure to convert character
ADD DL,AL            ; Add the result to DL
SHL DL,4             ; Shift DL left by 4 bits

; Read eighth character
xor ax,ax            ; Clear AX register
mov ah,0x1           ; Function to read a character from standard input
int 0x21             ; Interrupt 21h to read character
call champ           ; Call the 'champ' procedure to convert character
ADD DL,AL            ; Add the result to DL

; Move the results into VAR1 and VAR2
mov VAR1,bx          ; Store the value of BX in VAR1
mov VAR2,dx          ; Store the value of DX in VAR2

; Add the values in BX and DX
add bx,dx
mov RESULT,bx        ; Store the result in RESULT

; Halt the processor
hlt

.exit

; Procedure to convert ASCII character to numerical value
champ proc
    ; Compare AL with 'Z' (59h in hex)
    cmp al,59h
    ja forlowerchar  ; If AL > 'Z', jump to 'forlowerchar'
    ; Compare AL with '9' (39h in hex)
    cmp al,39H
    ja add1          ; If AL > '9', jump to 'add1'
    ; Convert '0'-'9' to 0-9
    sub al,30h
    jmp skip         ; Jump to 'skip'
forlowerchar:
    ; Convert 'a'-'f' to 10-15
    sub al,57h
    jmp skip2        ; Jump to 'skip2'
add1:
    ; Convert 'A'-'F' to 10-15
    sub al,37h
skip:
skip2:
    ret              ; Return from procedure
champ endp