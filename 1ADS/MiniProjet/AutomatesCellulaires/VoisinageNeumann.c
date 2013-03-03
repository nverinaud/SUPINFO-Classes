//
//  VoisinageNeumann.c
//  AutomatesCellulaires
//
//  Created by Nicolas VERINAUD on 01/02/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#include <stdio.h>
#include <libc.h>
#include "VoisinageUtils.h"
#include "VoisinageNeumann.h"

void saisie_neumann_avec_message(int T[5], const char *msg)
{
	int i = 0;
	int entreeUtilisateur = -1;
	
	while (i < 5)
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

void saisie_B_N(int B[5])
{
	saisie_neumann_avec_message(B, "Une cellule morte ayant %d voisins sera t‐elle vivante à la génération suivante ? (0: non, 1: oui) ");
}


void saisie_S_N(int S[5])
{
	saisie_neumann_avec_message(S, "Une cellule vivante ayant %d voisins sera t‐elle vivante à la génération suivante ? (0: non, 1: oui) ");
}


int nb_voisins_N(int **tab, int i, int j, int n, int m)
{
	Coordonnee test;
	int nbVoisins = 0;
	
	// Test au-dessus
	test.x = j;
	
	test.y = i - 1;
	if (test.y >= 0)
	{
		if (tab[test.y][test.x] == CELLULE_VIVANTE)
			nbVoisins++;
	}
	
	// Test en-dessous
	test.y = i + 1;
	if (test.y < n)
	{
		if (tab[test.y][test.x] == CELLULE_VIVANTE)
			nbVoisins++;
	}
	
	// Test à gauche
	test.y = i;
	
	test.x = j - 1;
	if (test.x >= 0)
	{
		if (tab[test.y][test.x] == CELLULE_VIVANTE)
			nbVoisins++;
	}
	
	// Test à droite
	test.x = j + 1;
	if (test.x < m)
	{
		if (tab[test.y][test.x] == CELLULE_VIVANTE)
			nbVoisins++;
	}
	
	return nbVoisins;
}


void generation_suivante_N(int **tab1, int **tab2, int n, int m, int B[5], int S[5])
{
	int nbVoisins = 0;
	int i, j;
	
	for (i = 0; i < n; i++)
	{
		for (j = 0; j < m; j++)
		{
			nbVoisins = nb_voisins_N(tab1, i, j, n, m);
			
			if (tab1[i][j] == CELLULE_MORTE && B[nbVoisins] == 1)
				tab2[i][j] = CELLULE_VIVANTE;
			else if (tab1[i][j] == CELLULE_VIVANTE && S[nbVoisins] == 0)
				tab2[i][j] = CELLULE_MORTE;
		}
	}
}


void jeu_N(int **tab1, int n, int m, int B[5], int S[5], int ng)
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
		generation_suivante_N(tab1, tab2, n, m, B, S); // On génère la colonie suivante dans tab2
		duplication(tab2, tab1, n, m); // On remplace la colonie actuelle par la colonie suivante
	}
	
	// On n'a plus besoin de notre deuxième colonie
	colonie_detruire(tab2, n, m);
}


void jeu_Neumann_predefini(int **tab1, int n, int m, int ng)
{
	jeu_Neumann_predefini_timing(tab1, n, m, ng, 0);
}







/*
 BONUS
 */
void jeu_N_timing(int **tab1, int n, int m, int B[5], int S[5], int ng, double timing)
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
		generation_suivante_N(tab1, tab2, n, m, B, S); // On génère la colonie suivante dans tab2
		duplication(tab2, tab1, n, m); // On remplace la colonie actuelle par la colonie suivante
		
		fflush(stdout);
		usleep(timing * 10e5);
	}
	
	// On n'a plus besoin de notre deuxième colonie
	colonie_detruire(tab2, n, m);
}


void jeu_Neumann_predefini_timing(int **tab1, int n, int m, int ng, double timing)
{
	int B[9] = {0, 1, 0, 1};
	int S[9] = {0, 1, 0, 1};
	
	jeu_N_timing(tab1, n, m, B, S, ng, timing);
}

