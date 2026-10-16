/* Exercice 00 — Observer
 * Ce fichier est fourni, vous n'avez pas à le modifier.
 * Il appelle la fonction calcul() écrite dans observer.asm et affiche ce qu'elle retourne.
 */
#include <stdio.h>

int calcul(void);   /* écrite en assembleur, retourne un entier dans eax */

int main(void)
{
    printf("calcul() = %d\n", calcul());
    return 0;
}
