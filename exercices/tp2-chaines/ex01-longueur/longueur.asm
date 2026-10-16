; Exercice 01 — Longueur
; Une fonction à écrire : longueur, qui compte les caractères du mot rangé dans texte.
; Nouveauté : on ne connaît pas le nombre de cases à l'avance. On avance octet par octet
; jusqu'à rencontrer l'octet qui vaut 0 : c'est la MARQUE DE FIN de toute chaîne en C.
;
; Algorithme en français :
;     adresse = texte              (l'adresse du premier octet)
;     longueur = 0
;     tant que l'octet à l'adresse != 0 :
;         longueur = longueur + 1
;         adresse = adresse + 1    (octet suivant : un caractère = 1 octet, pas 4 !)
;     retourner longueur
;
; Registres : longueur dans eax, adresse dans esi.
;
; Rappels :
;   cmp  byte [esi], 0     compare l'octet pointé par esi avec 0 ("byte" : un seul octet)
;   je   fin               saute si égal
;   inc  eax               eax = eax + 1 (comme add eax, 1)

section .text
global longueur

section .data
global texte
texte:  times 101 db 0

section .text

; int longueur(void)  ->  eax = nombre de caractères de texte
longueur:
    ; TODO : écrire 7 instructions et 2 étiquettes (boucle, fin)
    mov  eax, 0
    ret
