/* Exercice 01 — Somme d'un tableau
 * Ce fichier est fourni : il lit les données et affiche les résultats.
 * Vous n'avez PAS à le modifier. Votre travail est dans somme.asm.
 */
#include <stdio.h>

/* Fonctions écrites en assembleur (convention cdecl, 32 bits) */
int addition(int a, int b);            /* exemple fourni  */
int somme_tableau(const int *t, int n); /* à écrire        */

int main(void)
{
    int n;
    int t[100];

    if (scanf("%d", &n) != 1 || n < 0 || n > 100) {
        printf("entree invalide\n");
        return 1;
    }
    for (int i = 0; i < n; i++)
        scanf("%d", &t[i]);

    printf("addition(2, 3) = %d\n", addition(2, 3));
    printf("somme = %d\n", somme_tableau(t, n));
    return 0;
}
