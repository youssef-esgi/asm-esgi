; Exercice 03 — Boucle
; Une fonction à écrire : somme_1_a_n, qui calcule 1 + 2 + ... + n.
; Nouveauté : répéter des instructions tant qu'un compteur n'est pas à zéro.
;
; Algorithme en français :
;     somme = 0
;     compteur = n
;     tant que compteur != 0 :
;         somme = somme + compteur
;         compteur = compteur - 1
;     retourner somme
;
; Registres : somme dans eax (c'est le résultat), compteur dans ecx.
;
; Rappels :
;   dec  ecx           ecx = ecx - 1
;   cmp  ecx, 0        compare ecx à 0
;   je   fin           saute à l'étiquette fin si ecx == 0
;   jmp  boucle        remonte toujours à l'étiquette boucle

section .data
global n
n:  dd 0

section .text
global somme_1_a_n

; int somme_1_a_n(void)  ->  eax = 1 + 2 + ... + n
somme_1_a_n:
    ; TODO : écrire 7 instructions et 2 étiquettes (boucle, fin)
    mov  eax, 0
    ret
