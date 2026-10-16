; Exercice 05 — Afficher — CORRIGÉ
; Pour l'utiliser : copier la fonction dans afficher.asm (ou : cp corrige.asm afficher.asm)

section .text
global afficher

section .data
global texte, longueur
texte:     times 101 db 0
longueur:  dd 0

section .text

; void afficher(void)  ->  écrit longueur octets de texte sur la sortie standard
afficher:
    push ebx                ; on sauvegarde ebx (il appartient à l'appelant)
    mov  eax, 4             ; service n° 4 : write
    mov  ebx, 1             ; 1 = sortie standard (l'écran)
    mov  ecx, texte         ; adresse des octets à écrire (SANS crochets : l'adresse)
    mov  edx, [longueur]    ; nombre d'octets (AVEC crochets : la valeur)
    int  0x80               ; appel au système : Linux écrit les octets
    pop  ebx                ; on rend ebx intact
    ret

; Pour aller plus loin : écrire un retour à la ligne après le texte.
;
; section .data
; saut:  db 10              ; 10 = le code du caractère "nouvelle ligne"
;
;     mov  eax, 4
;     mov  ebx, 1
;     mov  ecx, saut
;     mov  edx, 1
;     int  0x80
;
; Et pour terminer un programme sans passer par le C : eax = 1 (exit), ebx = code de retour, int 0x80.
