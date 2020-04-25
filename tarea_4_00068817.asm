    org 100h
    mov ax, 0d ; Fn-1
    mov bx, 1d ; Fn-2
    mov SI, 0d ; 
    mov cx, 0d ; variable aux
    mov dx, 3d ; contador

    mov [SI+220h], ax ; se agrega 0
    inc SI
    mov [SI+220h], bx ; se agrega 1
    inc SI
    Add ax, bx        ; se suma ax+bx 1+0
    mov [SI+220h], ax ; se agrega 1
    inc SI

op1:mov cx, ax
    add ax, bx
    mov bx, cx
    mov [SI+220h], ax
    inc SI
    inc dx 

    cmp dx, 000Fh
    jb op1

    int 10h