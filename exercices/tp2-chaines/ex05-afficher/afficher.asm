; Exercice 05 — Afficher
; Une fonction à écrire : afficher, qui écrit texte à l'écran sans printf.
; Nouveauté : l'APPEL SYSTÈME. Un programme n'a pas le droit de toucher lui-même à l'écran,
; au disque ou au clavier : il le demande au système d'exploitation (Linux) avec
; l'instruction int 0x80 (une "interruption"). Avant, il range sa demande dans les registres :
;
;     eax = 4          le numéro du service "write" (écrire)
;     ebx = 1          où écrire : 1 = l'écran (la sortie standard)
;     ecx = adresse    des octets à écrire
;     edx = combien    d'octets écrire
;     int 0x80         "Linux, à toi !" : le système écrit, puis rend la main
;
; Règle de politesse : ebx appartient à l'appelant (main.c compte le retrouver intact).
; On le met de côté sur la pile avant, et on le reprend après :
;     push ebx         empile la valeur de ebx (la sauvegarde)
;     pop  ebx         dépile : ebx retrouve sa valeur
;
; Registres : eax, ebx, ecx, edx remplis comme ci-dessus.

section .text
global afficher

section .data
global texte, longueur
texte:     times 101 db 0
longueur:  dd 0             ; rempli par main.c

section .text

; void afficher(void)  ->  écrit longueur octets de texte sur la sortie standard
afficher:
    ; TODO : écrire 7 instructions (push ebx ... pop ebx)
    ret
