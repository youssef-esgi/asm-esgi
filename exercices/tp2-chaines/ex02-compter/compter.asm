; Exercice 02 — Compter
; Une fonction à écrire : compter, qui compte les octets de texte égaux au caractère c.
; Nouveauté : un registre de 8 bits. Le caractère c tient sur UN octet ; pour le garder
; dans un registre, on utilise la partie basse de edx, qui s'appelle dl (8 bits).
;
;     edx (32 bits) = [        24 bits        ][ dl : 8 bits ]
;
; Algorithme en français :
;     adresse = texte
;     compte = 0
;     cherché = c                  (dans dl)
;     tant que l'octet à l'adresse != 0 :
;         si l'octet à l'adresse == cherché :
;             compte = compte + 1
;         adresse = adresse + 1
;     retourner compte
;
; Registres : compte dans eax, adresse dans esi, caractère cherché dans dl.
;
; Rappels :
;   mov  dl, [c]           dl = l'octet rangé dans la variable c
;   cmp  [esi], dl         compare l'octet pointé par esi avec dl (dl fait 8 bits, donc
;                          l'assembleur sait qu'il faut lire 1 octet : pas besoin de "byte")
;   jne  suivant           saute si différent

section .text
global compter

section .data
global texte, c
texte:  times 101 db 0
c:      db 0                ; un seul octet (db), rempli par main.c

section .text

; int compter(void)  ->  eax = nombre d'octets de texte égaux à c
compter:
    ; TODO : écrire 10 instructions et 3 étiquettes (boucle, suivant, fin)
    mov  eax, 0
    ret
