org	100h

section .text

	call texto
	call 	cursor
	call 	phrase

	xor 	si, si 	;lo mimso que: mov si, 0000h

	lupi:	call 	kb
		cmp 	si, 5d ;   "h o l a $"
						;si; 0 1 2 3 4
		je	mostrar
		mov	[300h+si], al ; CS:0300h en adelante
		inc 	si
		jmp 	lupi 


	int 20h

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
		mov 	dh, 17d ; fila
		mov 	bh, 0h
		int 	10h
		ret

m_cursr2:
		mov 	ah, 02h
		mov 	dx, di  ; columna
		mov 	dh, 0d ; fila
		mov 	bh, 0h
		int 	10h
		ret

phrase:	mov 	di, 0d
lp:	mov 	cl, [msg+di-0d]
		call    m_cursr2
		call 	w_char
		inc	di
		cmp 	di, len
		jb	lp
		ret

mostrar:call 	w_strng
		call 	kb	; solo detenemos la ejecución
		int 	20h

kb:	mov	ah, 00h ;subrutina que detiene la ejecución hasta recibir
	int 	16h	;algun carácter en el buffer del teclado
	ret		;este carácter lo guarda en el registro AL

w_strng:mov	ah, 13h
		mov 	al, 01h ; asigna a todos los caracteres el atributo de BL,
		mov 	bh, 00h ; número de página
		mov	bl, 01100100b ; atributo de caracter
		mov	cx, si ; tamaño del string (SI, porque todavía guarda la última posición)
		mov	dl, 43h ; columna inicial
		mov	dh, 17h	; fila inicial
		; Como esta interrupción saca el string de ES:BP, tenemos que poner los valores correcpondientes
		push 	cs ; Segmento actual en el que está guardado nuestro string
		pop	es ; Puntero al segmento que queremos 
		mov	bp, 300h ; Dirección inicial de nuestra cadena de texto
		; ES:BP equals CS:300h 
		int 10h
		ret

section .data
msg	db 	"Ingrese una palabra de 5 caracteres "
len 	equ	$-msg