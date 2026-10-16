; Exercice 04 — Tableau
; Une fonction à écrire : somme_tableau, qui additionne les n entiers du tableau.
; Nouveauté : parcourir la mémoire avec une ADRESSE dans un registre (esi).
;
; Un tableau d'entiers en mémoire, c'est des cases de 4 octets les unes après les autres :
;     adresse   tableau     tableau+4   tableau+8   ...
;     contenu   tableau[0]  tableau[1]  tableau[2]  ...
;
; Algorithme en français :
;     somme = 0
;     adresse = tableau          (l'adresse de la première case)
;     compteur = n
;     tant que compteur != 0 :
;         somme = somme + (le contenu à l'adresse)
;         adresse = adresse + 4   (case suivante : un entier = 4 octets)
;         compteur = compteur - 1
;     retourner somme
;
; Registres : somme dans eax, adresse dans esi, compteur dans ecx.
;
; Rappels :
;   mov  esi, tableau    SANS crochets : esi = l'adresse de la première case
;   add  eax, [esi]      AVEC crochets : eax = eax + le contenu de la case pointée par esi
;   add  esi, 4          passe à la case suivante

section .data
global n, tableau
n:        dd 0
tableau:  times 100 dd 0    ; 100 entiers de 4 octets, initialisés à 0

section .text
global somme_tableau

; int somme_tableau(void)  ->  eax = tableau[0] + ... + tableau[n-1]
somme_tableau:
    ; TODO : écrire 9 instructions et 2 étiquettes (boucle, fin)
    mov  eax, 0
    ret
