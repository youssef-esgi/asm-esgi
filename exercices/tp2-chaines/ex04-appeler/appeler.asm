; Exercice 04 — Appeler
; Deux fonctions à écrire : carre (1 ligne) et somme_carres (6 lignes), qui appelle carre.
; Nouveauté : CALL. Jusqu'ici, seul main.c appelait vos fonctions. Ici, c'est une de vos
; fonctions qui en appelle une autre, deux fois.
;
;   call carre     1) note l'adresse de l'instruction suivante (l'adresse de retour)
;                     sur la pile, 2) saute à l'étiquette carre.
;   ret            reprend l'adresse de retour sur la pile et y saute :
;                  on revient juste APRÈS le call.
;
; Entre nos fonctions, on se passe les valeurs par les registres :
;   carre attend son nombre dans eax et rend le résultat dans eax.
;
; Algorithme en français (somme_carres) :
;     eax = a
;     appeler carre             (eax = a*a)
;     ecx = eax                 (on met a*a de côté : le prochain carre va écraser eax)
;     eax = b
;     appeler carre             (eax = b*b)
;     eax = eax + ecx
;     retourner

section .text
global somme_carres, carre

section .data
global a, b
a:  dd 0
b:  dd 0

section .text

; int carre(void)  ->  eax = eax * eax
carre:
    ; TODO : écrire 1 instruction
    ret

; int somme_carres(void)  ->  eax = a*a + b*b
somme_carres:
    ; TODO : écrire 6 instructions (dont deux call carre)
    mov  eax, 0
    ret
