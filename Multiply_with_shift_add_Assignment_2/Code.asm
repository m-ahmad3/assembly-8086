.model small
.stack 100h

.data
temp         db 4 dup(0)              ; Temporary storage for shifting
multiplicand db 0ffh, 0ffh, 0ffh, 0ffh ; Multiplicand (0xFFFFFFFF for testing)
multiplier   db 87h, 65h, 43h, 21h    ; Multiplier
product      db 8 dup(0)              ; Product result, initialized to 0
n            dw 32                    ; Loop counter (32 iterations)

.code

    ; Initialize data segment
    mov ax, @data
    mov ds, ax
    xor ax, ax

mainloop:
    ; Check LSB of multiplier and add multiplicand if necessary
    mov al, multiplier[3]
    shr al, 1
    jnc skip_addition

    ; Add multiplicand to product
    clc
    mov si, 7
    mov cx, 8

addition:
    mov al, temp[si]
    adc product[si], al
    dec si
    loop addition

skip_addition:
    ; Shift multiplicand left
    mov si, 7
    mov cx, 8
    clc

shift_multiplicand:
    rcl temp[si], 1
    dec si
    loop shift_multiplicand

    ; Shift multiplier right
    mov si, 0
    mov cx, 4
    clc

shift_multiplier:
    rcr multiplier[si], 1
    inc si
    loop shift_multiplier

    ; Decrement counter and loop if not zero
    dec n
    cmp n, 0
    jnz mainloop

    ; Terminate program
    hlt

.exit
