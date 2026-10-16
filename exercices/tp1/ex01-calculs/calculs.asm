; Exercice 01 — Calculs
; Trois fonctions à écrire : somme, difference, produit.
; Chaque fonction lit les variables a et b en mémoire et laisse son résultat dans eax.
;
; Rappels :
;   [a]  avec crochets  = le CONTENU de la variable a (la valeur)
;    a   sans crochets  = l'ADRESSE de la variable a (où elle est rangée)
;   mov  eax, [a]      eax = a
;   add  eax, [b]      eax = eax + b
;   sub  eax, [b]      eax = eax - b
;   imul eax, [b]      eax = eax * b
;   ret                fin de la fonction, le résultat est dans eax

section .data
global a, b
a:  dd 0            ; variable a : un entier de 4 octets (dd = "define double word")
b:  dd 0            ; variable b, remplie par main.c avant l'appel de vos fonctions

section .text
global somme, difference, produit

; int somme(void)  ->  eax = a + b
somme:
    ; TODO : écrire 2 instructions
    mov  eax, 0
    ret

; int difference(void)  ->  eax = a - b
difference:
    ; TODO : écrire 2 instructions
    mov  eax, 0
    ret

; int produit(void)  ->  eax = a * b
produit:
    ; TODO : écrire 2 instructions
    mov  eax, 0
    ret
