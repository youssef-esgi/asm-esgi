; Exercice 02 — Comparer
; Deux fonctions à écrire : maximum (le plus grand de a et b) et absolu (|a|).
; Nouveauté : comparer deux valeurs et SAUTER vers une étiquette selon le résultat.
;
; Rappels :
;   cmp  eax, edx      compare eax et edx (ne modifie ni eax ni edx) ; le saut qui suit
;                      utilise le résultat de cette comparaison
;   jge  etiquette     saute si "plus grand ou égal" (signé)   jg : strictement plus grand
;   jl   etiquette     saute si "plus petit"          (signé)   jle : plus petit ou égal
;   je   etiquette     saute si égal                            jne : saute si différent
;   jmp  etiquette     saute toujours
;   neg  eax           eax = -eax
;   une étiquette = un nom suivi de deux-points, sur sa propre ligne :   fin_max:

section .data
global a, b
a:  dd 0
b:  dd 0

section .text
global maximum, absolu

; int maximum(void)  ->  eax = le plus grand de a et b
;   Algorithme :  eax = a ; edx = b ; si eax >= edx alors fin, sinon eax = edx
maximum:
    ; TODO : écrire 5 instructions et 1 étiquette
    mov  eax, 0
    ret

; int absolu(void)  ->  eax = |a|
;   Algorithme :  eax = a ; si eax >= 0 alors fin, sinon eax = -eax
absolu:
    ; TODO : écrire 4 instructions et 1 étiquette
    mov  eax, 0
    ret
