/* Exercice 00 — Octets
 * Ce fichier est fourni, vous n'avez pas à le modifier.
 * Il lit un mot au clavier, le range dans la variable texte de octets.asm,
 * puis affiche le code du premier et du troisième caractère.
 */
#include <stdio.h>

extern char texte[101];     /* 100 caractères + l'octet nul final (octets.asm) */

int code_premier(void);     /* retourne le code (0..255) du 1er caractère  */
int code_troisieme(void);   /* retourne le code (0..255) du 3e caractère   */

int main(void)
{
    if (scanf("%100s", texte) != 1) {
        printf("entree invalide\n");
        return 1;
    }
    int p = code_premier();
    int t = code_troisieme();
    printf("premier   : '%c' = %d\n", p, p);
    printf("troisieme : '%c' = %d\n", t, t);
    return 0;
}
