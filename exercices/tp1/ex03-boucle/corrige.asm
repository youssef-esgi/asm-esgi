; Exercice 03 — Boucle — CORRIGÉ

section .data
global n
n:  dd 0

section .text
global somme_1_a_n

; int somme_1_a_n(void)  ->  eax = 1 + 2 + ... + n
somme_1_a_n:
    mov  eax, 0         ; somme = 0
    mov  ecx, [n]       ; compteur = n
boucle:
    cmp  ecx, 0         ; compteur == 0 ?
    je   fin            ; oui : on sort de la boucle
    add  eax, ecx       ; somme = somme + compteur
    dec  ecx            ; compteur = compteur - 1
    jmp  boucle         ; on recommence
fin:
    ret                 ; résultat dans eax

; Pour aller plus loin : la factorielle de n (n! = 1 x 2 x ... x n, 1 si n = 0).
; Même boucle, en remplaçant "somme = 0 ; add" par "produit = 1 ; imul".
;
; factorielle:
;     mov  eax, 1
;     mov  ecx, [n]
; boucle_fact:
;     cmp  ecx, 0
;     je   fin_fact
;     imul eax, ecx
;     dec  ecx
;     jmp  boucle_fact
; fin_fact:
;     ret
