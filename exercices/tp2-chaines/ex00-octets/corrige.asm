; Exercice 00 — Octets — CORRIGÉ
; Pour l'utiliser : copier les fonctions dans octets.asm (ou : cp corrige.asm octets.asm)

section .text
global code_premier, code_troisieme

section .data
global texte
texte:  times 101 db 0

section .text

; int code_premier(void)  ->  eax = code du 1er caractère
code_premier:
    movzx eax, byte [texte]     ; eax = l'octet à l'adresse texte, étendu à 32 bits
    ret

; int code_troisieme(void)  ->  eax = code du 3e caractère
code_troisieme:
    movzx eax, byte [texte+2]   ; 2 octets plus loin (un caractère = 1 octet)
    ret

; Pour aller plus loin : le dernier caractère d'un mot de longueur connue.
;
; dernier:                      ; main.c devrait ranger la longueur dans une variable longueur
;     mov   esi, [longueur]
;     movzx eax, byte [texte + esi - 1]
;     ret
