; Exercice 01 — Longueur — CORRIGÉ
; Pour l'utiliser : copier la fonction dans longueur.asm (ou : cp corrige.asm longueur.asm)

section .text
global longueur

section .data
global texte
texte:  times 101 db 0

section .text

; int longueur(void)  ->  eax = nombre de caractères de texte
longueur:
    mov  esi, texte         ; adresse = premier octet du texte
    mov  eax, 0             ; longueur = 0
boucle:
    cmp  byte [esi], 0      ; l'octet courant est-il la marque de fin ?
    je   fin                ; oui : terminé
    inc  eax                ; longueur = longueur + 1
    inc  esi                ; octet suivant (+1, un caractère = 1 octet)
    jmp  boucle
fin:
    ret                     ; résultat dans eax

; Pour aller plus loin : compter seulement les chiffres ('0' = 48 ... '9' = 57).
;
; nb_chiffres:
;     mov  esi, texte
;     mov  eax, 0
; boucle_c:
;     cmp  byte [esi], 0
;     je   fin_c
;     cmp  byte [esi], '0'
;     jl   suivant_c
;     cmp  byte [esi], '9'
;     jg   suivant_c
;     inc  eax
; suivant_c:
;     inc  esi
;     jmp  boucle_c
; fin_c:
;     ret
