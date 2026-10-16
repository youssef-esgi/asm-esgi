; Exercice 00 — Observer
; Ce programme est complet : rien à écrire. Lisez-le, devinez la valeur finale de eax,
; puis vérifiez avec `make trace`.
;
; Rappels :
;   mov  dst, src     copie src dans dst            (dst = src)
;   add  dst, src     additionne                    (dst = dst + src)
;   sub  dst, src     soustrait                     (dst = dst - src)
;   imul dst, src     multiplie (entiers signés)    (dst = dst * src)
;   ret               fin de la fonction ; main.c lit le résultat dans eax

section .text
global calcul

calcul:
    mov  eax, 10        ; eax = 10
    mov  edx, 3         ; edx = 3
    add  eax, edx       ; eax = eax + edx
    sub  eax, 5         ; eax = eax - 5
    imul eax, edx       ; eax = eax * edx
    mov  ecx, eax       ; ecx = eax
    sub  ecx, 4         ; ecx = ecx - 4
    add  eax, ecx       ; eax = eax + ecx
    ret                 ; retour : main.c affiche eax
