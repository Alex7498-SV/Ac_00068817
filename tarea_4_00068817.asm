    org 100h

    mov cx, 6d
    add cx, 8d
    add cx, 8d
    add cx, 1d
    add cx, 7d

    mov ax, cx
    mov cx, 5d

    div cx

    int 10h
