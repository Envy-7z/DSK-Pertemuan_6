.model SMALL
.code
ORG 100h
 
tdata: jmp proses
	lusername db 13,10,'username : $'
	lpassword db 13,10,'password : $'
	lditerima db 13,10,'diterima $'
	lditolak db 13,10,'ditolak $'

	; menyiapkan memori (var) untuk menerima inputan keyboard
	vusername db 23,?,23 dup(?)
	vpassword db 23,?,23 dup(?)

proses:
	mov ah,09h		;tampilkan tulisan username
	lea dx,lusername
	int 21h

	mov ah,0ah		;menunggu masukkan keyboard
	lea dx,vusername
	int 21h

	mov ah,09h		;tampilkan tulisan password
	lea dx,lpassword
	int 21h

	mov ah,0ah		
	lea dx,vpassword
	int 21h

	lea si,vusername
	lea di,vpassword

	cld
	mov cx,23
	rep cmpsb
	jne gagal

	mov ah,09h
	lea dx,lditerima
	int 21h
	jmp exit

gagal:
	mov ah,09h
	lea dx,lditolak
	int 21h
	jmp proses
exit:
	int 20h
end tdata