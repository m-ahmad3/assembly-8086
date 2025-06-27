.model small
.stack 100h
.data
.code

main proc
    ; Initialize the segment registers
    mov si,0x1000       ; Set SI to 0x1000
    mov di,0x2000       ; Set DI to 0x2000
    mov bx,0x3000       ; Set BX to 0x3000
    
    ; Store initial values
    mov [si],0x8        ; Store 0x8 at memory location [SI]
    mov [di],0x2        ; Store 0x2 at memory location [DI]
    
    ; Set ES segment register to 0
    mov ax,0
    mov es,ax
    
    ; Set AX to 0x2 (this is used to select the service routine)
    mov ax,0x2
    
    ; Compare AX to determine which service routine to call
    cmp ax,1
    je service1         ; Jump to service1 if AX is 1
    
    cmp ax,2
    je service2         ; Jump to service2 if AX is 2
    
    cmp ax,3
    je service3         ; Jump to service3 if AX is 3

return:
    ; Return from interrupt
    int 0x65            ; Software interrupt 0x65
    mov dx,[bx]         ; Move the result at [BX] to DX

main endp
hlt                    ; Halt the processor
.exit                  ; Exit the program

service1:
    ; Set interrupt vector for interrupt 0x65 to isradd
    mov word ptr es:[0x65*4],isradd
    mov word ptr es:[0x65*4+2],cs
    jmp return         ; Jump to return

service2:
    ; Set interrupt vector for interrupt 0x65 to isrmul
    mov word ptr es:[0x65*4],isrmul
    mov word ptr es:[0x65*4+2],cs
    jmp return         ; Jump to return

service3:
    ; Set interrupt vector for interrupt 0x65 to isrdiv
    mov word ptr es:[0x65*4],isrdiv
    mov word ptr es:[0x65*4+2],cs
    jmp return         ; Jump to return

; Interrupt service routine for addition
isradd proc
    mov ax,[si]        ; Load value at [SI] into AX
    add ax,[di]        ; Add value at [DI] to AX
    mov [bx],ax        ; Store the result at [BX]
    iret               ; Return from interrupt
isradd endp

; Interrupt service routine for multiplication
isrmul proc
    push dx            ; Save DX register
    mov ax,[si]        ; Load value at [SI] into AX
    mul [di]           ; Multiply AX by value at [DI]
    mov [bx],ax        ; Store the low word of the result at [BX]
    mov [bx+2],dx      ; Store the high word of the result at [BX+2]
    pop dx             ; Restore DX register
    iret               ; Return from interrupt
isrmul endp

; Interrupt service routine for division
isrdiv proc
    push dx            ; Save DX register
    mov ax,[si]        ; Load value at [SI] into AX
    div [di]           ; Divide AX by value at [DI]
    pop dx             ; Restore DX register
    iret               ; Return from interrupt
isrdiv endp
