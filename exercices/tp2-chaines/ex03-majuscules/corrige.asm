; Exercice 03 — Majuscules — CORRIGÉ
; Pour l'utiliser : copier la fonction dans majuscules.asm (ou : cp corrige.asm majuscules.asm)

section .text
global majuscules

section .data
global texte
texte:  times 101 db 0

section .text

; void majuscules(void)  ->  texte transformé sur place
majuscules:
    mov   esi, texte        ; adresse = premier octet
boucle:
    movzx eax, byte [esi]   ; eax = octet courant
    cmp   eax, 0            ; fin de la chaîne ?
    je    fin
    cmp   eax, 'a'          ; plus petit que 'a' (97) ?
    jl    suivant           ; oui : pas une minuscule, on ne touche à rien
    cmp   eax, 'z'          ; plus grand que 'z' (122) ?
    jg    suivant           ; oui : pas une minuscule
    sub   byte [esi], 32    ; minuscule : on écrit octet - 32 au même endroit
suivant:
    inc   esi               ; octet suivant
    jmp   boucle
fin:
    ret

; Pour aller plus loin : l'inverse, minuscules (ajouter 32 entre 'A' et 'Z'),
; puis inverser_casse (les deux à la fois).
