/* Exercice 02 — Compter
 * Ce fichier est fourni, vous n'avez pas à le modifier.
 * Il lit un caractère c puis un mot, les range dans compter.asm,
 * et affiche combien de fois c apparaît dans le mot.
 */
#include <stdio.h>

extern char texte[101];
extern char c;              /* le caractère cherché (1 octet), défini dans compter.asm */

int compter(void);          /* retourne le nombre d'octets de texte égaux à c */

int main(void)
{
    if (scanf(" %c %100s", &c, texte) != 2) {
        printf("entree invalide\n");
        return 1;
    }
    printf("'%c' apparait %d fois dans \"%s\"\n", c, compter(), texte);
    return 0;
}
