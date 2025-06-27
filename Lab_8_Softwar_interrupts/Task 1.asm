.model small 
.stack 100h
.data
.code

; Initialize the data segment
mov ax,@data
mov ds,ax

; Read first character
xor ax,ax            ; Clear AX register
mov ah,0x1           ; Set AH to 1 (function to read a character from standard input)
int 0x21             ; Interrupt 21h to read character
call champ           ; Call the 'champ' procedure to convert character
ADD BH,AL            ; Add the result to BH
SHL BH,4             ; Shift BH left by 4 bits

; Read second character
xor ax,ax            ; Clear AX register
mov ah,0x1           ; Set AH to 1 (function to read a character from standard input)
int 0x21             ; Interrupt 21h to read character
call champ           ; Call the 'champ' procedure to convert character
ADD BH,AL            ; Add the result to BH

; Read third character
xor ax,ax            ; Clear AX register
mov ah,0x1           ; Set AH to 1 (function to read a character from standard input)
int 0x21             ; Interrupt 21h to read character
call champ           ; Call the 'champ' procedure to convert character
ADD BL,AL            ; Add the result to BL
SHL BL,4             ; Shift BL left by 4 bits

; Read fourth character
xor ax,ax            ; Clear AX register
mov ah,0x1           ; Set AH to 1 (function to read a character from standard input)
int 0x21             ; Interrupt 21h to read character
call champ           ; Call the 'champ' procedure to convert character
ADD BL,AL            ; Add the result to BL

; End of program
xor ax,ax            ; Clear AX register
HLT                  ; Halt the processor

.exit

; Procedure to convert ASCII character to numerical value
champ proc
    ; Compare the character with '9' (39h in hex) and 'Z' (59h in hex)
    cmp al,59h       ; Compare AL with 59h ('Z')
    ja forlowerchar  ; If AL > 'Z', jump to 'forlowerchar'
    cmp al,39h       ; Compare AL with 39h ('9')
    ja add1          ; If AL > '9', jump to 'add1'
    sub al,30h       ; Convert '0'-'9' to 0-9
    jmp skip         ; Jump to 'skip'
forlowerchar:
    sub al,57h       ; Convert 'a'-'f' to 10-15
    jmp skip2        ; Jump to 'skip2'
add1:
    sub al,37h       ; Convert 'A'-'F' to 10-15
skip:
skip2:
    ret              ; Return from procedure
champ endp