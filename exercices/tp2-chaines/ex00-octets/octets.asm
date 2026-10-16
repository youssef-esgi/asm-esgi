; Exercice 00 — Octets
; Deux fonctions d'une ligne à écrire : code_premier et code_troisieme.
; Nouveauté : une chaîne de caractères, c'est une suite d'OCTETS (1 octet = 1 caractère),
; terminée par un octet qui vaut 0. Chaque caractère a un numéro : son code ASCII.
;     'A' = 65   'B' = 66 ...  'Z' = 90      'a' = 97 ... 'z' = 122      '0' = 48 ... '9' = 57
;
;     adresse   texte      texte+1    texte+2    texte+3  ...
;     contenu   'b' (98)   'o' (111)  'n' (110)  'j' ...   0 à la fin
;
; Rappels :
;   movzx eax, byte [texte]      eax = l'octet rangé à l'adresse texte (de 0 à 255)
;                                 "byte" : on lit UN octet, pas 4
;                                 "movzx" : les 3 autres octets de eax sont mis à 0
;   movzx eax, byte [texte+2]    l'octet situé 2 cases plus loin (le 3e caractère)

section .text
global code_premier, code_troisieme

section .data
global texte
texte:  times 101 db 0      ; 101 octets à 0 (db = "define byte"), remplis par main.c

section .text

; int code_premier(void)  ->  eax = code du 1er caractère
code_premier:
    ; TODO : écrire 1 instruction
    mov  eax, 0
    ret

; int code_troisieme(void)  ->  eax = code du 3e caractère
code_troisieme:
    ; TODO : écrire 1 instruction
    mov  eax, 0
    ret
