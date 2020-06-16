	org 100h
	section .text
		
		call 	texto
		call 	cursor
		call 	phrase

		xor 	si, si 	;lo mimso que: mov si, 0000h

		lupi:	call 	kb
			cmp 	si, 5d 
			je	start
			sub al, 30h
			mov	[500h+si], al ; CS:0500h en adelante
			inc 	si
			jmp 	lupi


start:	xor si, si
	mov al, 0d
	mov bl, 5h
	call sum
	mov [510h], al
	mov ax, [510h]
	div bl
	mov [520h], al
	call mostrar
	ret

sum: 	mov cl, [500h+si]
	add al, cl
	inc si
	cmp si, 5d
	jb sum
	ret

texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

cursor: mov	ah, 01h
	mov 	ch, 00000000b
	mov 	cl, 00001110b
	;   IRGB
	int 	10h
	ret

w_char:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 01000000b
	mov 	cx, 1h
	int 	10h
	ret

mostrar:
	cmp     al, 1d
        je      phrase9
        cmp     al, 2d
        je      phrase8
        cmp     al, 3d
        je      phrase7
        cmp     al, 4d
        je      phrase6
        cmp     al, 5d
        je      phrase5
        cmp     al, 6d
        je      phrase4
        cmp     al, 7d
        je      phrase3
        cmp     al, 8d
        je      phrase2
        cmp     al, 9d
        je      phrase1
        cmp     al, 10d
        je      phrase0

m_cursr:
	mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, 0d ; fila
	mov 	bh, 0h
	int 	10h
	ret

m_cursr2:
	mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, 10d ; fila
	mov 	bh, 0h
	int 	10h
	ret

phrase:	mov 	di, 0d
lp:	mov 	cl, [msg+di-0d]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len
	jb	lp
	ret

phrase0:	mov 	di, 0d
lp0:	mov 	cl, [msg0+di]
	call    m_cursr2
	call 	w_char
	inc	di
	cmp 	di, len0
	jb	lp0
	ret

phrase1:	mov 	di, 0d
lp1:	mov 	cl, [msg1+di]
	call    m_cursr2
	call 	w_char
	inc	di
	cmp 	di, len1
	jb	lp1
	ret

phrase2:	mov 	di, 0d
lp2:	mov 	cl, [msg2+di]
	call    m_cursr2
	call 	w_char
	inc	di
	cmp 	di, len2
	jb	lp2
	ret

phrase3:	mov 	di, 0d
lp3:	mov 	cl, [msg3+di]
	call    m_cursr2
	call 	w_char
	inc	di
	cmp 	di, len3
	jb	lp3
	ret

phrase4:mov 	di, 0d
lp4:	mov 	cl, [msg4+di]
	call    m_cursr2
	call 	w_char
	inc	di
	cmp 	di, len4
	jb	lp4
	ret

phrase5:mov 	di, 0d
lp5:	mov 	cl, [msg5+di]
	call    m_cursr2
	call 	w_char
	inc	di
	cmp 	di, len5
	jb	lp5
	ret

phrase6:mov 	di, 0d
lp6:	mov 	cl, [msg6+di]
	call    m_cursr2
	call 	w_char
	inc	di
	cmp 	di, len6
	jb	lp6
	ret

phrase7:mov 	di, 0d
lp7:	mov 	cl, [msg7+di]
	call    m_cursr2
	call 	w_char
	inc	di
	cmp 	di, len7
	jb	lp7
	ret

phrase8:mov 	di, 0d
lp8:	mov 	cl, [msg8+di]
	call    m_cursr2
	call 	w_char
	inc	di
	cmp 	di, len8
	jb	lp8
	ret

phrase9:mov 	di, 0d
lp9:	mov 	cl, [msg9+di]
	call    m_cursr2
	call 	w_char
	inc	di
	cmp 	di, len9
	jb	lp9
	ret




kb:	mov	ah, 1h ;subrutina que detiene la ejecución hasta recibir
	int 	21h	;algun carácter en el buffer del teclado
	ret		;este carácter lo guarda en el registro AL

section .data
	msg 	db	"Ingrese los ultimos 5 caracteres de su carnet"
	len 	equ	$-msg
	msg0 	db 	"Perfecto solo Dios"
	len0	equ	$-msg0
	msg1 	db 	"Siempre me esfuerzo"
	len1	equ	$-msg1
	msg2 	db 	"Colocho"
	len2	equ	$-msg2
	msg3 	db 	"Muy bien"
	len3	equ	$-msg3
	msg4 	db 	"Peor es nada"
	len4	equ	$-msg4
	msg5 	db 	"En el segundo"
	len5	equ	$-msg5
	msg6 	db 	"Me recupero"
	len6	equ	$-msg6
	msg7 	db 	"Hay salud"
	len7	equ	$-msg7
	msg8 	db 	"Aun se pasa"
	len8	equ	$-msg8
	msg9 	db 	"Solo necesito el 0"
	len9	equ	$-msg9