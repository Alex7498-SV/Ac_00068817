;Ejercicio #1
    org 100h
        mov cx, 6d ;Se inserta el 6 en el registro cx
        add cx, 8d ;Se le suma 8
        add cx, 8d ;Se le suma 8
        add cx, 1d ;Se le suma 1
        add cx, 7d ;Se le suma 7
        mov ax, cx ;Se inserta el contenido de cx en ax pára poder operarlo con div
        mov cx, 5d ;Se inserta un 5 en cx
        div cx ;Se divide el registro ax entre el registro cx
        mov cl, "P"
        mov [200h], cl
        mov cl, "E"
        mov [201h], cl
        mov cl, "O"
        mov [202h], cl
        mov cl, "R"
        mov [203h], cl
        mov cl, " "
        mov [204h], cl
        mov cl, "E"
        mov [205h], cl
        mov cl, "S"
        mov [206h], cl
        mov cl, " "
        mov [207h], cl
        mov cl, "N"
        mov [208h], cl
        mov cl, "A"
        mov [209h], cl
        mov cl, "D"
        mov [20Ah], cl
        mov cl, "A"
        mov [20Bh], cl

        int 10h


;ejercicio #2
    org 100h
        mov ax, 2d ; inicializando ax con los casos iniciales
        mov bx, 2d ; inicializando el multiplicador
        mov SI, 1d ; 
        mov cx, 1d
        mov [210h], ax ;
prcd1:  mul bx
        mov [SI+210h], ax ;
        inc SI
        inc cx
        cmp  ax, 100h
        jb prcd1
prcd2:  mul bx
        inc SI
        mov [SI+210h], ax
        inc cx
        inc SI
        
        cmp cx, 11d
        jb prcd2
    int 10h

;Ejercicio 3
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