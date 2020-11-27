;=================================;
; PROGRAM : A1.ASM ;
; FUNGSI : MENCETAK KARATER 'A';
; BESERTA ATRIBUTNYA ;
; DENGAN INT 10h ;
;============================S'to=;
.MODEL SMALL
.CODE
ORG 100h
Proses :
MOV AH,09h ; Nilai servis untuk mencetak karakter
MOV AL,'A' ; AL = Karakter yang akan dicetak
MOV BH,00h ; Nomor Halaman layar
MOV BL,93h ; Warna atau atribut dari karakter
MOV CX,03h ; Banyaknya karakter yang ingin dicetak
INT 10h ; Laksanakan !!!
INT 20h ; Selesai ! kembali ke DOS
END Proses
