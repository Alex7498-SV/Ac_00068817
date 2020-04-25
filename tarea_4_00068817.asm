    org 100h
    mov ax, 0d ; Fn-1
    mov bx, 1d ; Fn-2
    mov SI, 0d ; 
    mov cx, 0d ; variable aux
    mov dx, 3d ; contador

    mov [SI+220h], ax
    inc SI
    mov [SI+220h], bx
    inc SI
    Add ax, bx
    mov [SI+220h], ax

op1:mov cx, ax
    add ax, bx
    mov bx, cx
    mov [SI+220h], ax
    inc SI
    inc dx 

    cmp dx, 000Fh
    jb op1

    int 10h