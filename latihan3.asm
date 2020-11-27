.model SMALL
.code
        ORG 100h
tdata: jmp proses
        lusername db 13,10,'Username : $'
        lpassword db 13,10,'Password : $'
        lditerima db 13,10,'diterima  $'
        lditolak  db 13,10,'ditolak  $'

        vusername db 23,?,23 dup(?)
        vpassword db 23,?,23 dup(?)

proses:
        mov ah,09h
        lea dx, lusername
        int 21h

        mov ah,0ah
        lea dx, vusername
        int 21h

        mov ah,09h
        lea dx, lpassword
        int 21h

        mov ah,0ah
        lea dx, vpassword
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

gagal :
        mov ah,09h
        lea dx,lditolak
        int 21h
        jmp proses
exit : 
        int 20h
end tdata
