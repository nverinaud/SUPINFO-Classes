//
//  VoisinageCore.c
//  AutomatesCellulaires
//
//  Created by Nicolas VERINAUD on 01/02/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include "VoisinageCore.h"
#include "VoisinageUtils.h"

/*
 Saisie du nombre de lignes et de colonnes
 par l'utilisateur.
 
 @param n nombre de lignes à retourner
 @param m nombre de colonnes à retourner
 */
void dimensionnement(int *n, int *m)
{
	*n = *m = 0;
	
	do {
		printf("Saisissez le nombre de lignes: ");
		scanf("%d", n);
		
		while (getchar() != '\n'); // On vide le buffer de saisie au cas où l'utilisateur est un peu noob :)
		
	} while (*n < 1); // On vérifie que l'utilisateur rentre bien un nombre supérieur ou égal à 1
	
	do {
		printf("Saisissez le nombre de colonnes: ");
		scanf("%d", m);
		
		while (getchar() != '\n');
		
	} while (*m < 1);
}


/*
 Initialisation de la colonie.
 
 @param tab la colonie
 @param n hauteur de la colonie
 @param m largeur de la colonie
 */
void initialisation(int **tab, int n, int m)
{
	int i, j;
	
	for (i = 0; i < n; i++)
		for (j = 0; j < m; j++)
			tab[i][j] = 0;
	
	Coordonnee coord = { 0, 0 }; // On utilise notre structure Coordonne ici !
	int nbCellulesVivantesPremiereGeneration = 0;
	
	do {
		printf("Combien de cellules vivantes souhaitez-vous pour la premiere generation: ");
		scanf("%d", &nbCellulesVivantesPremiereGeneration);
		
		while (getchar() != '\n');
		
	} while (nbCellulesVivantesPremiereGeneration < 1);
	
	i = 1;
	while (i <= nbCellulesVivantesPremiereGeneration)
	{
		printf("Coordonnees de la cellule vivante n°%d:\n", i);
		printf("- y (entre 1 et %d): ", n);
		scanf("%d", &coord.y);
		
		while (getchar() != '\n');
		
		printf("- x (entre 1 et %d): ", m);
		scanf("%d", &coord.x);
		
		while (getchar() != '\n');
		
		coord.x--; // Les abscisses du tableau vont de 0 à n-1, or l'utilisateur saisi un nombre entre 1 et n donc il faut décrémenter.
		coord.y--; // Les ordonnées du tableau vont de 0 à m-1, or l'utilisateur saisi un nombre entre 1 et m donc il faut décrémenter.
		
		if ( (0 <= coord.y && coord.y < n) && (0 <= coord.x && coord.x < m) )
		{
			if (tab[coord.y][coord.x] == 0)
			{
				tab[coord.y][coord.x] = 1;
				i++;
			}
			else
			{
				printf("La cellule a la position [%d][%d] est deja en vie. Reessayez!\n", coord.y+1, coord.x+1);
			}
		}
		else
		{
			printf("Vous devez saisir des coordonnees entre 1 et %d pour x et entre 1 et %d pour y. Reessayez!\n", m, n);
		}
	}
}


/*
 Saisie du nombre de générations.
 
 @return (int) le nombre de générations voulues par l'utilisateur (supérieur à 0)
 */
int nb_generations(void)
{
	int nb;
	
	do {
		printf("Combien de generations vont vivre les cellules (au moins 1): ");
		scanf("%d", &nb);
		
		while (getchar() != '\n');
	} while (nb < 1);
	
	return nb;
}


/*
 Affichage de la colonie.
 
 @param tab la colonie
 @param n hauteur de la colonie
 @param m largeur de la colonie
 */
void affiche(int **tab, int n, int m)
{
	int i, j;
	for (i = 0; i < n; i++)
	{
		for (j = 0; j < m; j++)
			printf("%c ", tab[i][j] == CELLULE_VIVANTE ? 'o' : '.');
		
		printf("\n");
	}
}


/*
 Affichage de la colonie dans un fichier.
 
 @param tab la colonie
 @param n hauteur de la colonie
 @param m largeur de la colonie
 @param nom le chemin vers le fichier dans lequel écrire
 */
void affiche_fichier(int **tab, int n, int m, char *nom)
{
	int i, j;
	FILE *fichier = fopen(nom, "w");
	
	if (fichier != NULL)
	{
		for (i = 0; i < n; i++)
		{
			for (j = 0; j < m; j++)
				fprintf(fichier, "%c ", tab[i][j] ? 'o' : '.');
			
			fputc('\n', fichier);
		}
		
		fclose(fichier);
	}
	else
	{
		printf("Impossible d'ouvrir le fichier \"%s\".\n", nom);
	}
}


/*
 Copie les valeurs du tableau tab1 dans le tableau tab2.
 
 @param tab1 tableau à copier
 @param tab2 tableau copié
 @param n hauteur des tableaux
 @param m largeur des tableaux
 */
void duplication(int **tab1, int **tab2, int n, int m)
{
	int i, j;
	
	for (i = 0; i < n; i++)
		for (j = 0; j < m; j++)
			tab2[i][j] = tab1[i][j];
}
