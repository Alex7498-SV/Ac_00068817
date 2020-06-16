org 	100h

section .text

	call 	texto	
	call 	cursor
	call 	phrase
	call	kbwait

	int 	20h

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

kbwait: mov 	ax, 0000h
	int 	16h
	ret

m_cursr:
	mov 	ah, 02h
	mov 	dx, di  ; columna
	mov 	dh, 17d ; fila
	mov 	bh, 0h
	int 	10h
	ret


phrase:	mov 	di, 43d
lupi:	mov 	cl, [msg+di-43d]
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len
	jb	lupi
	ret


section .data
msg	db 	"Gato"
len 	equ	$-msg+43d

