//
//  main.c
//  ExemplesSlide09
//
//  Created by Nicolas VERINAUD on 14/01/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char * argv[])
{
	/* Slide 62 - Tableaux dynamiques de pointeurs */
	int **tab;
	int nombreDeLignes, i, j;
	
	printf("Combien de lignes: ");
	scanf("%d", &nombreDeLignes);
	
	// Remplissage
	tab = malloc( nombreDeLignes * sizeof(int*) ); // on alloue de la mémoire pour assez de lignes dans tab
	
	for (i = 0; i < nombreDeLignes; i++)
	{
		tab[i] = malloc( (i+1) * sizeof(int) ); // pour chaque ligne on alloue de la mémoire pour i+1 colonnes
		
		for (j = 0; j < i+1; j++)
		{
			tab[i][j] = i+1;
		}
	}
	
	// Affichage
	for (i = 0; i < nombreDeLignes; i++)
	{
		for (j = 0; j < i+1; j++)
		{
			printf("[%d][%d]=%d\t", i, j, tab[i][j]);
		}
		printf("\n");
	}
	
	// Libération de la mémoire
	for (i = 0; i < nombreDeLignes; i++)
	{
		free(tab[i]);
	}
	
	free(tab);
	
    return 0;
}












