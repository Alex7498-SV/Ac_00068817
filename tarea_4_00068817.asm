    org 100h

        mov ax, 2d ; inicializando ax con los casos iniciales
        mov bx, 2d ; inicializando el multiplicador
        mov SI, 1d ; 
        mov cx, 1d
        mov [210h], ax ;

prcd1:  mul bx
        mov [SI+210h], ax ;
        inc SI
        inc cx

        cmp  ax, 100h
        jb prcd1

prcd2:  mul bx
        inc SI
        mov [SI+210h], ax
        inc cx
        inc SI
        
        cmp cx, 11d
        jb prcd2

    int 10h