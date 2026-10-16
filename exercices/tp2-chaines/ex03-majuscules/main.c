/* Exercice 03 — Majuscules
 * Ce fichier est fourni, vous n'avez pas à le modifier.
 * Il lit un mot, appelle majuscules() qui le transforme SUR PLACE dans texte,
 * puis affiche le résultat.
 */
#include <stdio.h>

extern char texte[101];

void majuscules(void);      /* remplace chaque minuscule de texte par sa majuscule */

int main(void)
{
    if (scanf("%100s", texte) != 1) {
        printf("entree invalide\n");
        return 1;
    }
    majuscules();
    printf("%s\n", texte);
    return 0;
}
