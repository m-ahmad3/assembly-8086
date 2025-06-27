.model small
.stack 100h
.data
    A dw 11h, 21h, 31h, 41h, 51h, 61h, 71h, 81h, 91h, 110h
    SUM dw 0

.code
    mov ax, @data
    mov ds, ax

    mov si, offset A
    mov cx, 10       ; Set loop counter to 10
    mov ax, 0x0000h  ; Moving 0000h into ax to hold the sum

sum_loop:
    add ax, [si]     ; Add the current element of A to the sum in ax
    add si, 2        ; Move to the next element since each element is 2 bytes
    loop sum_loop    ; Repeat until cx becomes 0

    mov [SUM], ax    ; Store the sum in SUM

    ; At this point, the sum is stored in SUM

.exit