org	100h

section .text

        call    texto
        call    cursor
        call    phrase

	xor     si, si 
lupi:   call 	kb
        cmp     si, 1d
        je      signoM
        cmp     al, "S"
        je      igual
        mov	[300h+si], al
	inc 	si
        jmp     mostrar

signoM: mov    cl, "+"
        mov	[300h+si], cl
        inc    si
        mov	[300h+si], al
        inc    si
        jmp    mostrar

igual:  mov     cl, "="
        mov     [300h+si], cl
        inc     si
        call    sum
        jmp     show

sum:    mov     al, [300h]
        add     al, [302h]
        sub     al, 30h
        mov     cl, 39h
        cmp     al, cl
        ja      mayor
        cmp     al, cl
        jb      menor
        ret

menor:  mov     [300h+si], al
        inc     si
        ret

mayor:  mov     cl, 31h
        mov     [300h+si], cl
        inc     si
        sub     al, 0Ah
        mov     [300h+si], al
        inc     si
        ret

mostrar:call    w_strng
        cmp     si, 4d
        jbe     lupi

	int 	20h

show:   call    w_strngx2
        cmp     si,4d
        jbe     lupi 

        int     20h

texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

kb:	mov	ah, 00h 
	int 	16h	
	ret		

w_strng:mov	ah, 13h
	mov 	al, 01h 
	mov 	bh, 00h
	mov	bl, 00101110b
	mov	cx, si
	mov	dl, 30d
	mov	dh, 15d
	push 	cs 
	pop	es 
	mov	bp, 300h 
	int     10h
	ret

w_strngx2:mov	ah, 13h
	mov 	al, 01h 
	mov 	bh, 00h
	mov	bl, 01110000b
	mov	cx, si
	mov	dl, 30d
	mov	dh, 15d
	push 	cs 
	pop	es 
	mov	bp, 300h 
	int     10h
	ret

cursor: mov    ah, 01h
        mov    ch, 00000000b
        mov    cl, 00001110b
        int    10h
        ret

w_char:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 01000000b
	mov 	cx, 1h
	int 	10h
	ret

m_cursr:mov     ah, 02h
        mov     dx, di
        mov     dh, 0d
        mov     bh, 0h
        int     10h
        ret

phrase: mov     di, 0d

lupi2:  mov     cl, [msg+di]
        call    m_cursr
        call    w_char
        inc     di
        cmp     di, len
        jb      lupi2
        ret


section .data

msg     db      "Escriba el primer numero: "
len     equ     $-msg