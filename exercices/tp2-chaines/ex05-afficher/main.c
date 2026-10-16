/* Exercice 05 — Afficher
 * Ce fichier est fourni, vous n'avez pas à le modifier.
 * Il lit un mot, range sa longueur dans la variable longueur, puis appelle afficher()
 * qui écrit le mot à l'écran SANS passer par printf : directement par un appel système.
 */
#include <stdio.h>
#include <string.h>

extern char texte[101];
extern int longueur;        /* nombre d'octets à écrire (afficher.asm) */

void afficher(void);        /* écrit les octets de texte sur la sortie standard */

int main(void)
{
    if (scanf("%100s", texte) != 1) {
        printf("entree invalide\n");
        return 1;
    }
    longueur = (int) strlen(texte);
    afficher();
    printf("\n(%d octet(s) ecrit(s) par l'appel systeme)\n", longueur);
    return 0;
}
