//
//  VoisinageMoore.c
//  AutomatesCellulaires
//
//  Created by Nicolas VERINAUD on 28/01/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <libc.h>
#include "VoisinageMoore.h"


/*
 Saisie de 0 ou 1 dans un tableau de 9 éléments avec
 un message paramétrable pour l'utilisateur.
 
 BUT:	factoriser les fonctions saisie_B_M et saisie_S_M quasiment
		identiques.
 
 @param T un tableau de 9 éléments
 @param msg un message à afficher à l'utilisateur.
		ATTENTION: ce message est une chaine formattée avec au moins un '%d' à l'intérieur !
 */
void saisie_moore_avec_message(int T[9], const char *msg)
{
	int i = 0;
	int entreeUtilisateur = -1;
	
	while (i < 9)
	{
		printf(msg, i);
		scanf("%d", &entreeUtilisateur);
		
		while (getchar() != '\n');
		
		if (entreeUtilisateur == 0 || entreeUtilisateur == 1)
		{
			T[i] = entreeUtilisateur;
			i++;
		}
	}
}


void saisie_B_M(int B[9])
{
	saisie_moore_avec_message(B, "Une cellule morte ayant %d voisins sera t‐elle vivante à la génération suivante ? (0: non, 1: oui) ");
}


void saisie_S_M(int S[9])
{
	saisie_moore_avec_message(S, "Une cellule vivante ayant %d voisins sera t‐elle vivante à la génération suivante ? (0: non, 1: oui) ");
}


/*
 Retourne le nombres de voisins d'une cellule.
 
 @param tab la colonie
 @param i abscisse de la cellule
 @param j ordonnée de la cellule
 @param n hauteur de la colonie
 @param m largeur de la colonie
 @return (int) le nombres de voisins de la cellules i, j
 */
int nb_voisins_M(int **tab, int i, int j, int n, int m)
{
	Coordonnee test;
	Coordonnee min = { j - 1, i - 1 };
	Coordonnee max = { j + 1, i + 1 };
	int nbVoisins = 0;
	
	// Si on est après le bord gauche, on se met au bord
	if (min.x < 0)
		min.x = 0;
	
	// Si on est après le bord haut, on se met au bord
	if (min.y < 0)
		min.y = 0;
	
	// Si on est après le bord droit, on se met au bord
	if (max.x > m - 1)
		max.x = m - 1;
	
	// Si on est après le bord bas, on se met au bord
	if (max.y > n - 1)
		max.y = n - 1;
	
	for (test.y = min.y; test.y <= max.y; test.y++)
	{
		for (test.x = min.x; test.x <= max.x; test.x++)
		{
			if (test.y == i && test.x == j) // Position de notre cellule, ce n'est pas un voisin !
				continue;
			
			if (tab[test.y][test.x]) // équivalent à if (tab[test.y][test.x] == 1)
				nbVoisins++;
		}
	}
	
	return nbVoisins;
}


/*
 Remplie le tableau tab2 avec la génération suivante par rapport
 à tab1.
 
 @param tab1 colonie de génération n
 @param tab2 colonie de génération n+1
 @param n hauteur des tableaux
 @param m largeur des tableaux
 @param B règles de vie de Moore pour les cellules mortes
 @param S règles de survie de Moore pour les cellules vivantes
 */
void generation_suivante_M(int **tab1, int **tab2, int n, int m, int B[9], int S[9])
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
				tab2[i][j] = CELLULE_MORTE;
		}
	}
}


/*
 Évolution d'une colonie pendant ng générations.
 Affiche chacune des générations.
 
 @param tab1 colonie initiale
 @param n hauteur de la colonie
 @param m largeur de la colonie
 @param B règles de vie de Moore pour les cellules mortes
 @param S règles de survie de Moore pour les cellules vivantes
 @param ng nombre de générations voulu
 */
void jeu_M(int **tab1, int n, int m, int B[9], int S[9], int ng)
{
	int i;
	int **tab2 = NULL;
	
	// On a besoin d'une colonie pour représenter la génération n+1
	tab2 = colonie_creer(n, m);
	
	duplication(tab1, tab2, n, m);
	
	for (i = 0; i < ng; i++)
	{
		printf("Colonie numero %d\n", i+1);
		affiche(tab1, n, m); // On affiche la colonie pour la génération i
		generation_suivante_M(tab1, tab2, n, m, B, S); // On génère la colonie suivante dans tab2
		duplication(tab2, tab1, n, m); // On remplace la colonie actuelle par la colonie suivante
	}
	
	// On n'a plus besoin de notre deuxième colonie
	colonie_detruire(tab2, n, m);
}


void jeu_conway(int **tab1, int n, int m, int ng)
{
	int B[9] = {0, 0, 0, 1};
	int S[9] = {0, 0, 1, 1};
	
	jeu_M(tab1, n, m, B, S, ng);
	
	/*
	 On constate que les cellules forment un carré de 2x2 si elles 
	 ont assez de voisines.
	 */
}


void jeu_fredkin_M(int **tab1, int n, int m, int ng)
{
	int B[9] = {0, 1, 0, 1, 0, 1, 0, 1};
	int S[9] = {0, 1, 0, 1, 0, 1, 0, 1};
	
	jeu_M(tab1, n, m, B, S, ng);
	
	/*
	 On constate que les cellules évoluent de manière symetrique.
	 Un test intéressant :
		- 20 lignes
		- 20 colonnes
		- Cellules vivantes au départ, 4 : [10][10], [11][10], [10][11], [11][11]
		- 30 générations environ
	 */
}






/* BONUS */

void jeu_M_avec_timing(int **tab1, int n, int m, int B[9], int S[9], int ng, double timing)
{
	int i;
	int **tab2 = NULL;
	
	// On a besoin d'une colonie pour représenter la génération n+1
	tab2 = colonie_creer(n, m);
	
	duplication(tab1, tab2, n, m);
	
	for (i = 0; i < ng; i++)
	{
		printf("Colonie numero %d\n", i+1);
		affiche(tab1, n, m); // On affiche la colonie pour la génération i
		generation_suivante_M(tab1, tab2, n, m, B, S); // On génère la colonie suivante dans tab2
		duplication(tab2, tab1, n, m); // On remplace la colonie actuelle par la colonie suivante
		
		fflush(stdout);
		usleep(timing * 10e5);
	}
	
	// On n'a plus besoin de notre deuxième colonie
	colonie_detruire(tab2, n, m);
}


void jeu_conway_timing(int **tab1, int n, int m, int ng, double timing)
{
	int B[9] = {0, 0, 0, 1};
	int S[9] = {0, 0, 1, 1};
	
	jeu_M_avec_timing(tab1, n, m, B, S, ng, timing);
}


void jeu_fredkin_M_timing(int **tab1, int n, int m, int ng, double timing)
{
	int B[9] = {0, 1, 0, 1, 0, 1, 0, 1};
	int S[9] = {0, 1, 0, 1, 0, 1, 0, 1};
	
	jeu_M_avec_timing(tab1, n, m, B, S, ng, timing);
}




