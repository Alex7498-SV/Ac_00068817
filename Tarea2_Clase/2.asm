	org 100h
	section .text
		
		call 	texto
		call 	cursor
		call 	phrase
		call	psw

		xor 	si, si 	;lo mimso que: mov si, 0000h

		lupi:	call 	kb
			cmp 	al, "E" ;Se detiene al presionar E
			je	start
			mov	[300h+si], al ; CS:0300h en adelante
			inc 	si
			jmp 	lupi 


		

		psw:mov cl, "a"
			mov [200h], cl
			mov cl, "d"
				mov [201h], cl
			mov cl, "m"
				mov [202h], cl    
			mov cl, "i"
				mov [203h], cl
			mov cl, "n"
				mov [204h], cl
			ret

restart: xor si, si
	call lupi

start:xor si, si
	call validar
	call mostrar



validar: 
	mov bl, [200h+si]
	mov cl, [300h+si]
	cmp cl, bl
	jne restart
	inc si
	cmp si, 5d
	jb validar
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

phrase2:	mov 	di, 0d
lp2:	mov 	cl, [msg2+di]
	call    m_cursr2
	call 	w_char
	inc	di
	cmp 	di, len2
	jb	lp2
	ret

mostrar:call 	phrase2	; solo detenemos la ejecución
		int 	20h

kb:	mov	ah, 1h ;subrutina que detiene la ejecución hasta recibir
	int 	21h	;algun carácter en el buffer del teclado
	ret		;este carácter lo guarda en el registro AL

	section .data
	msg 	db	"Ingrese su contraseña de 5 caracteres "
	len 	equ	$-msg

	msg2	db	"BIENVENIDO "
	len2	equ	$-msg2