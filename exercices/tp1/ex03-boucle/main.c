/* Exercice 03 — Boucle
 * Ce fichier est fourni, vous n'avez pas à le modifier.
 * Il lit un entier n, puis appelle somme_1_a_n() et affiche le résultat.
 */
#include <stdio.h>

extern int n;             /* variable définie dans boucle.asm */

int somme_1_a_n(void);    /* retourne 1 + 2 + ... + n (0 si n = 0) */

int main(void)
{
    if (scanf("%d", &n) != 1 || n < 0) {
        printf("entree invalide\n");
        return 1;
    }
    printf("somme de 1 a %d = %d\n", n, somme_1_a_n());
    return 0;
}
