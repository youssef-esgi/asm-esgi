/* Exercice 04 — Appeler
 * Ce fichier est fourni, vous n'avez pas à le modifier.
 * Il lit deux entiers a et b et affiche a*a + b*b, calculé par somme_carres()
 * qui appelle deux fois la fonction carre().
 */
#include <stdio.h>

extern int a, b;

int somme_carres(void);     /* retourne a*a + b*b */

int main(void)
{
    if (scanf("%d %d", &a, &b) != 2) {
        printf("entree invalide\n");
        return 1;
    }
    printf("%d*%d + %d*%d = %d\n", a, a, b, b, somme_carres());
    return 0;
}
