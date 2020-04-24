    org 100h

    mov cx, 6d ;Se inserta el 6 en el registro cx
    add cx, 8d ;Se le suma 8
    add cx, 8d ;Se le suma 8
    add cx, 1d ;Se le suma 1
    add cx, 7d ;Se le suma 7

    mov ax, cx ;Se inserta el contenido de cx en ax pára poder operarlo con div
    mov cx, 5d ;Se inserta un 5 en cx

    div cx ;Se divide el registro ax entre el registro cx

    mov cl, "P"
    mov [200h], cl
    mov cl, "E"
    mov [201h], cl
    mov cl, "O"
    mov [202h], cl
    mov cl, "R"
    mov [203h], cl
    mov cl, " "
    mov [204h], cl
    mov cl, "E"
    mov [205h], cl
    mov cl, "S"
    mov [206h], cl
    mov cl, " "
    mov [207h], cl
    mov cl, "N"
    mov [208h], cl
    mov cl, "A"
    mov [209h], cl
    mov cl, "D"
    mov [20Ah], cl
    mov cl, "A"
    mov [20Bh], cl

    int 10h
