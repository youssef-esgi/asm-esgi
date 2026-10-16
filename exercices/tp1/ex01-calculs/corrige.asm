; Exercice 01 — Calculs — CORRIGÉ
; Pour l'utiliser : copier les fonctions dans calculs.asm (ou : cp corrige.asm calculs.asm)

section .data
global a, b
a:  dd 0
b:  dd 0

section .text
global somme, difference, produit

; int somme(void)  ->  eax = a + b
somme:
    mov  eax, [a]       ; eax = a       (on charge la valeur de a)
    add  eax, [b]       ; eax = eax + b
    ret

; int difference(void)  ->  eax = a - b
difference:
    mov  eax, [a]       ; eax = a
    sub  eax, [b]       ; eax = eax - b
    ret

; int produit(void)  ->  eax = a * b
produit:
    mov  eax, [a]       ; eax = a
    imul eax, [b]       ; eax = eax * b  (multiplication signée)
    ret

; Pour aller plus loin : la division entière a / b (b != 0).
; idiv divise edx:eax (64 bits) par son opérande ; cdq étend le signe de eax dans edx.
; Quotient dans eax, reste dans edx.
;
; quotient:
;     mov  eax, [a]
;     cdq                 ; edx = signe de eax (0 ou -1)
;     idiv dword [b]      ; eax = a / b, edx = a % b
;     ret
