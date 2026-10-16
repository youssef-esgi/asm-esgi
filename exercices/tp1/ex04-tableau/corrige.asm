; Exercice 04 — Tableau — CORRIGÉ

section .data
global n, tableau
n:        dd 0
tableau:  times 100 dd 0

section .text
global somme_tableau

; int somme_tableau(void)  ->  eax = tableau[0] + ... + tableau[n-1]
somme_tableau:
    mov  eax, 0         ; somme = 0
    mov  esi, tableau   ; adresse = tableau   (SANS crochets : l'adresse de la 1re case)
    mov  ecx, [n]       ; compteur = n        (AVEC crochets : la valeur de n)
boucle:
    cmp  ecx, 0         ; compteur == 0 ?
    je   fin            ; oui : on sort
    add  eax, [esi]     ; somme = somme + contenu de la case pointée par esi
    add  esi, 4         ; case suivante (un entier = 4 octets)
    dec  ecx            ; compteur = compteur - 1
    jmp  boucle         ; on recommence
fin:
    ret                 ; résultat dans eax

; Pour aller plus loin : le maximum du tableau (n >= 1).
;
; maximum_tableau:
;     mov  esi, tableau
;     mov  ecx, [n]
;     mov  eax, [esi]     ; maximum = première case
; boucle_max:
;     cmp  ecx, 0
;     je   fin_max
;     cmp  eax, [esi]     ; maximum >= case courante ?
;     jge  suivant
;     mov  eax, [esi]     ; non : nouveau maximum
; suivant:
;     add  esi, 4
;     dec  ecx
;     jmp  boucle_max
; fin_max:
;     ret
