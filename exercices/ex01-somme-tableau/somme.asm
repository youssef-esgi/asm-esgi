; Exercice 01 — Somme d'un tableau
; Assembleur x86 32 bits, syntaxe Intel (NASM), convention d'appel cdecl.
;
; Rappel cdecl :
;   - les arguments sont empilés de droite à gauche par l'appelant
;   - après le prologue (push ebp / mov ebp, esp) :
;         [ebp+8]  = 1er argument,  [ebp+12] = 2e argument, ...
;   - la valeur de retour est dans eax
;   - eax, ecx, edx peuvent être modifiés librement
;   - ebx, esi, edi, ebp doivent être restaurés avant de sortir

section .text
global addition
global somme_tableau

; ---------------------------------------------------------------
; int addition(int a, int b)       <- EXEMPLE FOURNI
; ---------------------------------------------------------------
addition:
    push ebp
    mov  ebp, esp

    mov  eax, [ebp+8]       ; eax = a
    add  eax, [ebp+12]      ; eax = a + b

    pop  ebp
    ret

; ---------------------------------------------------------------
; int somme_tableau(const int *t, int n)     <- À ÉCRIRE
;   t : adresse du premier élément (entiers de 4 octets)
;   n : nombre d'éléments (peut valoir 0)
;   retourne t[0] + t[1] + ... + t[n-1]
;
; Indices : mettre l'adresse dans un registre (ex. esi, à sauvegarder),
;   le compteur dans ecx, accumuler dans eax avec [esi + ecx*4]
;   ou avancer esi de 4 à chaque tour.
; ---------------------------------------------------------------
somme_tableau:
    push ebp
    mov  ebp, esp

    ; TODO : remplacer cette ligne par votre code
    mov  eax, 0

    pop  ebp
    ret
