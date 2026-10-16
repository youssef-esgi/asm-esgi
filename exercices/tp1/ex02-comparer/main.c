/* Exercice 02 — Comparer
 * Ce fichier est fourni, vous n'avez pas à le modifier.
 * Il lit deux entiers a et b, puis appelle vos deux fonctions et affiche les résultats.
 */
#include <stdio.h>

extern int a, b;        /* variables définies dans comparer.asm */

int maximum(void);      /* retourne le plus grand de a et b */
int absolu(void);       /* retourne la valeur absolue de a   */

int main(void)
{
    if (scanf("%d %d", &a, &b) != 2) {
        printf("entree invalide\n");
        return 1;
    }
    printf("maximum = %d\n", maximum());
    printf("absolu  = %d\n", absolu());
    return 0;
}
