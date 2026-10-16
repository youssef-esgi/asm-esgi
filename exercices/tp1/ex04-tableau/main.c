/* Exercice 04 — Tableau
 * Ce fichier est fourni, vous n'avez pas à le modifier.
 * Il lit n puis n entiers, les range dans le tableau défini dans tableau.asm,
 * puis appelle somme_tableau() et affiche le résultat.
 */
#include <stdio.h>

extern int n;             /* nombre d'éléments (variable de tableau.asm)       */
extern int tableau[100];  /* les éléments, 4 octets chacun (tableau.asm)        */

int somme_tableau(void);  /* retourne tableau[0] + ... + tableau[n-1]           */

int main(void)
{
    if (scanf("%d", &n) != 1 || n < 0 || n > 100) {
        printf("entree invalide\n");
        return 1;
    }
    for (int i = 0; i < n; i++)
        scanf("%d", &tableau[i]);

    printf("somme = %d\n", somme_tableau());
    return 0;
}
