/* Exercice 01 — Longueur
 * Ce fichier est fourni, vous n'avez pas à le modifier.
 * Il lit un mot, le range dans texte (longueur.asm) et affiche sa longueur.
 */
#include <stdio.h>

extern char texte[101];

int longueur(void);         /* retourne le nombre de caractères avant l'octet nul */

int main(void)
{
    if (scanf("%100s", texte) != 1) {
        printf("entree invalide\n");
        return 1;
    }
    printf("longueur de \"%s\" = %d\n", texte, longueur());
    return 0;
}
