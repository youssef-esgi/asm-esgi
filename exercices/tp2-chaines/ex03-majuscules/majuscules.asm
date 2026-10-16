; Exercice 03 — Majuscules
; Une fonction à écrire : majuscules, qui transforme texte sur place.
; Nouveauté : ÉCRIRE dans la mémoire, et tester un encadrement (entre 'a' et 'z').
;
; Dans la table ASCII, 'a' = 97 et 'A' = 65 : une minuscule moins 32 donne sa majuscule.
; Les autres caractères (chiffres, majuscules déjà là, '-', ...) ne doivent pas changer.
;
; Algorithme en français :
;     adresse = texte
;     tant que l'octet à l'adresse != 0 :
;         si l'octet >= 'a' et l'octet <= 'z' :
;             octet = octet - 32      (on écrit le nouvel octet AU MÊME ENDROIT)
;         adresse = adresse + 1
;     (rien à retourner)
;
; Rappels :
;   movzx eax, byte [esi]    eax = l'octet courant (plus simple à comparer dans eax)
;   cmp   eax, 'a'           'a' entre apostrophes = 97, l'assembleur fait la conversion
;   jl    suivant            plus petit que 'a' : pas une minuscule
;   jg    suivant            plus grand que 'z' : pas une minuscule
;   sub   byte [esi], 32     retire 32 à l'octet EN MÉMOIRE (byte : un seul octet)

section .text
global majuscules

section .data
global texte
texte:  times 101 db 0

section .text

; void majuscules(void)  ->  texte transformé sur place, rien dans eax
majuscules:
    ; TODO : écrire 11 instructions et 3 étiquettes (boucle, suivant, fin)
    ret
