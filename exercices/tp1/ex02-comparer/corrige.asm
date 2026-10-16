; Exercice 02 — Comparer — CORRIGÉ

section .data
global a, b
a:  dd 0
b:  dd 0

section .text
global maximum, absolu

; int maximum(void)  ->  eax = le plus grand de a et b
maximum:
    mov  eax, [a]       ; eax = a
    mov  edx, [b]       ; edx = b
    cmp  eax, edx       ; compare a et b (ne modifie ni eax ni edx)
    jge  fin_max        ; si a >= b : a est déjà dans eax, on saute à la fin
    mov  eax, edx       ; sinon : le maximum est b
fin_max:
    ret                 ; résultat dans eax

; int absolu(void)  ->  eax = |a|
absolu:
    mov  eax, [a]       ; eax = a
    cmp  eax, 0         ; compare a et 0
    jge  fin_abs        ; si a >= 0 : rien à faire
    neg  eax            ; sinon : eax = -eax
fin_abs:
    ret

; Pour aller plus loin : le signe de a (-1, 0 ou 1).
;
; signe:
;     mov  eax, [a]
;     cmp  eax, 0
;     je   fin_signe      ; a == 0 : eax vaut déjà 0
;     jl   negatif
;     mov  eax, 1         ; a > 0
;     ret
; negatif:
;     mov  eax, -1        ; a < 0
; fin_signe:
;     ret
