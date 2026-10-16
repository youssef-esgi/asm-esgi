/* Exercice 01 — Calculs
 * Ce fichier est fourni, vous n'avez pas à le modifier.
 * Il lit deux entiers a et b au clavier, les range dans les variables a et b
 * définies dans calculs.asm, puis appelle vos trois fonctions et affiche les résultats.
 */
#include <stdio.h>

extern int a, b;        /* variables définies dans calculs.asm (section .data) */

int somme(void);        /* retourne a + b dans eax */
int difference(void);   /* retourne a - b dans eax */
int produit(void);      /* retourne a * b dans eax */

int main(void)
{
    if (scanf("%d %d", &a, &b) != 2) {
        printf("entree invalide\n");
        return 1;
    }
    printf("somme      = %d\n", somme());
    printf("difference = %d\n", difference());
    printf("produit    = %d\n", produit());
    return 0;
}
