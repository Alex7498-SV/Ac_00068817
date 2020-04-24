    org 100h

        mov ax, 2d
        mov bx, 2d

        mov [210h], ax
        mul bx
        mov [211h], ax
        mul bx
        mov [212h], ax
        mul bx
        mov [213h], ax
        mul bx
        mov [214h], ax
        mul bx
        mov [215h], ax
        mul bx
        mov [216h], ax
    

    int 10h