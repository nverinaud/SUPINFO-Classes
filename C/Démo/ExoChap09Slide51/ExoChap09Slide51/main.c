
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, const char * argv[])
{
	// Demande utilisateur
	int taille;
	
	do {
		printf("Veuillez entrer une taille pour un magnifique tableau qui tue: ");
		scanf("%d", &taille);
	} while (taille <= 0);
	
	// Creation du tableau
	int *tableau = NULL;
	tableau = malloc(taille * sizeof(int));
	
	// Remplissage du tableau
	int i;
	srand((unsigned)time(NULL));
	
	for (i = 0; i < taille; i++)
	{
		tableau[i] = rand()%100+1;
	}
	
	// Affichage du tableau
	int *tableauPtr = tableau;
	do
	{
		printf("%3d ", *tableauPtr++);
	}
	while (tableauPtr != &tableau[taille-1]);
	
	// Recherche du maximum
	int max = *tableau;
	
	for (i = 1; i < taille; i++)
	{
		if (*(tableau+i) > max)
		{
			max = *(tableau+i);
		}
	}
	
	printf("\nmax vaut %d", max);
	
	// On libère la mémoire parce que nous sommes de gentils citoyens
	free(tableau);
	
    return 0;
}





















