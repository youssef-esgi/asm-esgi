; Exercice 04 — Appeler — CORRIGÉ
; Pour l'utiliser : copier les fonctions dans appeler.asm (ou : cp corrige.asm appeler.asm)

section .text
global somme_carres, carre

section .data
global a, b
a:  dd 0
b:  dd 0

section .text

; int carre(void)  ->  eax = eax * eax
carre:
    imul eax, eax           ; eax = eax au carré
    ret                     ; retour juste après le call

; int somme_carres(void)  ->  eax = a*a + b*b
somme_carres:
    mov  eax, [a]           ; eax = a
    call carre              ; eax = a*a
    mov  ecx, eax           ; ecx = a*a, mis de côté
    mov  eax, [b]           ; eax = b
    call carre              ; eax = b*b
    add  eax, ecx           ; eax = b*b + a*a
    ret

; Pour aller plus loin : hypothenuse_carree n'est autre que somme_carres ;
; écrire cube (eax = eax*eax*eax) et somme_cubes sur le même modèle, en réutilisant carre :
;
; cube:
;     mov  ecx, eax           ; attention : ecx est aussi utilisé par somme_cubes,
;     imul eax, eax           ; il faudrait alors y mettre de côté dans edx
;     imul eax, ecx
;     ret
