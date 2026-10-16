; Exercice 02 — Compter — CORRIGÉ
; Pour l'utiliser : copier la fonction dans compter.asm (ou : cp corrige.asm compter.asm)

section .text
global compter

section .data
global texte, c
texte:  times 101 db 0
c:      db 0

section .text

; int compter(void)  ->  eax = nombre d'octets de texte égaux à c
compter:
    mov  esi, texte         ; adresse = premier octet
    mov  eax, 0             ; compte = 0
    mov  dl, [c]            ; dl = le caractère cherché (8 bits)
boucle:
    cmp  byte [esi], 0      ; fin de la chaîne ?
    je   fin
    cmp  [esi], dl          ; l'octet courant est-il le caractère cherché ?
    jne  suivant            ; non : on passe
    inc  eax                ; oui : compte = compte + 1
suivant:
    inc  esi                ; octet suivant
    jmp  boucle
fin:
    ret

; Pour aller plus loin : la position (à partir de 0) de la première occurrence de c,
; ou -1 si elle n'existe pas.
;
; position:
;     mov  esi, texte
;     mov  eax, 0
;     mov  dl, [c]
; boucle_p:
;     cmp  byte [esi], 0
;     je   absent
;     cmp  [esi], dl
;     je   fin_p              ; trouvé : eax est la position
;     inc  eax
;     inc  esi
;     jmp  boucle_p
; absent:
;     mov  eax, -1
; fin_p:
;     ret
