//
//  VoisinageFantomes.c
//  AutomatesCellulaires
//
//  Created by Nicolas VERINAUD on 01/02/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#include <stdio.h>
#include <libc.h>
#include "VoisinageCore.h"
#include "VoisinageMoore.h"
#include "VoisinageFantomes.h"

void initialisation_fantome(int **tab, int n, int m)
{
	initialisation(tab, n, m);
	
	int i;
	
	Coordonnee coord = { 0, 0 };
	int nbCellulesFantomesPremiereGeneration = 0;
	
	do {
		printf("Combien de cellules fantomes souhaitez-vous pour la premiere generation: ");
		scanf("%d", &nbCellulesFantomesPremiereGeneration);
		
		while (getchar() != '\n');
		
	} while (nbCellulesFantomesPremiereGeneration < 1);
	
	i = 1;
	while (i <= nbCellulesFantomesPremiereGeneration)
	{
		printf("Coordonnees de la cellule fantome n°%d:\n", i);
		printf("- x (entre 1 et %d): ", n);
		scanf("%d", &coord.x);
		
		while (getchar() != '\n');
		
		printf("- y (entre 1 et %d): ", m);
		scanf("%d", &coord.y);
		
		while (getchar() != '\n');
		
		coord.x--;
		coord.y--;
		
		if ( (0 <= coord.x && coord.x < n) && (0 <= coord.y && coord.y < m) )
		{
			if (tab[coord.x][coord.y] == 0)
			{
				tab[coord.x][coord.y] = 2;
				i++;
			}
			else
			{
				printf("La cellule a la position [%d][%d] est deja en vie ou fantome. Reessayez!\n", coord.x+1, coord.y+1);
			}
		}
		else
		{
			printf("Vous devez saisir des coordonnees entre 1 et %d pour x et entre 1 et %d pour y. Reessayez!\n", n, m);
		}
	}
}


void affiche_fantome(int **tab, int n, int m)
{
	int i, j;
	char c;
	
	for (i = 0; i < n; i++)
	{
		for (j = 0; j < m; j++)
		{
			switch (tab[i][j])
			{
				case   CELLULE_MORTE: c = '.'; break;
				case CELLULE_VIVANTE: c = 'o'; break;
				case CELLULE_FANTOME: c = 'x'; break;
			}
			
			printf("%c ", c);
		}
		
		printf("\n");
	}
}


void affiche_fichier_fantome(int **tab, int n, int m, char *nom)
{
	int i, j;
	char c;
	FILE *fichier = fopen(nom, "w");
	
	if (fichier != NULL)
	{
		for (i = 0; i < n; i++)
		{
			for (j = 0; j < m; j++)
			{
				switch (tab[i][j])
				{
					case   CELLULE_MORTE: c = '.'; break;
					case CELLULE_VIVANTE: c = 'o'; break;
					case CELLULE_FANTOME: c = 'x'; break;
				}
				
				fprintf(fichier, "%c ", c);
			}
			
			fputc('\n', fichier);
		}
		
		fclose(fichier);
	}
	else
	{
		printf("Impossible d'ouvrir le fichier \"%s\".\n", nom);
	}
}


void generation_suivante_Fantome(int **tab1, int **tab2, int n, int m, int B[9], int S[9])
{
	int nbVoisins = 0;
	int i, j;
	
	for (i = 0; i < n; i++)
	{
		for (j = 0; j < m; j++)
		{
			nbVoisins = nb_voisins_M(tab1, i, j, n, m);
			
			if (tab1[i][j] == CELLULE_MORTE && B[nbVoisins] == 1)
				tab2[i][j] = CELLULE_VIVANTE;
			else if (tab1[i][j] == CELLULE_VIVANTE && S[nbVoisins] == 0)
				tab2[i][j] = CELLULE_FANTOME;
			else if (tab1[i][j] == CELLULE_FANTOME)
				tab2[i][j] = CELLULE_MORTE;
		}
	}
}


void jeu_Fantome(int **tab1, int n, int m, int B[9], int S[9], int ng)
{
	int i;
	int **tab2 = NULL;
	
	// On a besoin d'une colonie pour représenter la génération n+1
	tab2 = colonie_creer(n, m);
	
	duplication(tab1, tab2, n, m);
	
	for (i = 0; i < ng; i++)
	{
		printf("Colonie numero %d\n", i+1);
		affiche_fantome(tab1, n, m); // On affiche la colonie pour la génération i
		generation_suivante_Fantome(tab1, tab2, n, m, B, S); // On génère la colonie suivante dans tab2
		duplication(tab2, tab1, n, m); // On remplace la colonie actuelle par la colonie suivante
	}
	
	// On n'a plus besoin de notre deuxième colonie
	colonie_detruire(tab2, n, m);
}


void jeu_brian_silverman(int **tab1, int n, int m, int ng)
{
	jeu_brian_silverman_timing(tab1, n, m, ng, 0);
	
	/*
	 On constate que les cellules évoluent avec une symétrie
	 centrale et meurent à la 4ème génération.
	 
	 G1
	 . . . . . . . . . .
	 . . . . . . . . . .
	 . . . . . . . . . .
	 . . . . . x . . . .
	 . . . x o o . . . .
	 . . . . o o x . . .
	 . . . . x . . . . .
	 . . . . . . . . . .
	 . . . . . . . . . .
	 . . . . . . . . . .
	 
	 G2
	 . . . . . . . . . .
	 . . . . . . . . . .
	 . . . . . . . . . .
	 . . . o . . o . . .
	 . . . . x x . . . .
	 . . . . x x . . . .
	 . . . o . . o . . .
	 . . . . . . . . . .
	 . . . . . . . . . .
	 . . . . . . . . . .
	 
	 
	 G3
	 . . . . . . . . . .
	 . . . . . . . . . .
	 . . . . . . . . . .
	 . . . x . . x . . .
	 . . . . . . . . . .
	 . . . . . . . . . .
	 . . . x . . x . . .
	 . . . . . . . . . .
	 . . . . . . . . . .
	 . . . . . . . . . .
	 
	 G4
	 . . . . . . . . . .
	 . . . . . . . . . .
	 . . . . . . . . . .
	 . . . . . . . . . .
	 . . . . . . . . . .
	 . . . . . . . . . .
	 . . . . . . . . . .
	 . . . . . . . . . .
	 . . . . . . . . . .
	 . . . . . . . . . .
	 */
}









/* 
 BONUS
 */
void jeu_Fantome_timing(int **tab1, int n, int m, int B[9], int S[9], int ng, double timing)
{
	int i;
	int **tab2 = NULL;
	
	// On a besoin d'une colonie pour représenter la génération n+1
	tab2 = colonie_creer(n, m);
	
	duplication(tab1, tab2, n, m);
	
	for (i = 0; i < ng; i++)
	{
		printf("Colonie numero %d\n", i+1);
		affiche_fantome(tab1, n, m); // On affiche la colonie pour la génération i
		generation_suivante_Fantome(tab1, tab2, n, m, B, S); // On génère la colonie suivante dans tab2
		duplication(tab2, tab1, n, m); // On remplace la colonie actuelle par la colonie suivante
		
		fflush(stdout);
		usleep(timing * 10e5);
	}
	
	// On n'a plus besoin de notre deuxième colonie
	colonie_detruire(tab2, n, m);
}


void jeu_brian_silverman_timing(int **tab1, int n, int m, int ng, double timing)
{
	int B[9] = {0, 0, 1};
	int S[9] = {0};
	
	jeu_Fantome_timing(tab1, n, m, B, S, ng, timing);
}




