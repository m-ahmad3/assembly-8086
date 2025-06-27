.model small
.data
    A dw 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20
    B dw 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 22, 33, 44, 55, 66, 77, 88, 99, 112
    C dw 20 dup(0)
.code
    mov ax, @data
    mov ds, ax


    mov si, 0
    mov cx, 20  ; Number of elements in the arrays

    L1:
    mov ax, [A+si]  ; Load element from array A into ax
    add ax, [B+si]  ; Add corresponding element from array B
    mov [C+si], ax  ; Store the result in array C
    add si, 2       ; Move to the next element (since each element is 2 bytes)
    loop L1         ; Repeat until cx becomes 0

    ; At this point, array C contains the sum of elements from arrays A and B

.exit   


