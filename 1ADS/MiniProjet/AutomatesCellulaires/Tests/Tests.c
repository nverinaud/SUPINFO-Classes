//
//  Tests.c
//  AutomatesCellulaires
//
//  Created by Nicolas VERINAUD on 03/03/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#include <stdio.h>
#include "Voisinage.h"
#include "Tests.h"

void tests_execute(void)
{
	double total = 0;
	double results = 0;
	results = tests_nb_voisins_M();
	printf("[SCORE] nb_voisins_M: %.2f\n", results);
	total += results;
	
	results = tests_generation_suivante_M();
	printf("[SCORE] generation_suivante_M: %.2f\n", results);
	total += results;
	
	results = tests_nb_voisins_N();
	printf("[SCORE] nb_voisins_N: %.2f\n", results);
	total += results;
	
	results = tests_generation_suivante_N();
	printf("[SCORE] generation_suivante_N: %.2f\n", results);
	total += results;
	
	results = tests_generation_suivante_Fantome();
	printf("[SCORE] generation_suivante_Fantome: %.2f\n", results);
	total += results;
	
	printf("[SCORE] %.2f", total/5.);
}

#define N 3
#define M 3

// Moore
double tests_nb_voisins_M(void)
{
	double results = 0;
	
	int i, j;
	int nbVoisins = 0;
	int **colonie = colonie_creer(N, M);
	
	for (i = 0; i < N; i++)
		for (j = 0; j < M; j++)
			colonie[i][j] = CELLULE_VIVANTE;
	
	
	nbVoisins = nb_voisins_M(colonie, 0, 0, N, M);
	results += (nbVoisins == 3);
	
	nbVoisins = nb_voisins_M(colonie, 0, 1, N, M);
	results += (nbVoisins == 5);
	
	nbVoisins = nb_voisins_M(colonie, 0, 2, N, M);
	results += (nbVoisins == 3);
	
	nbVoisins = nb_voisins_M(colonie, 1, 0, N, M);
	results += (nbVoisins == 5);
	
	nbVoisins = nb_voisins_M(colonie, 1, 1, N, M);
	results += (nbVoisins == 8);
	
	nbVoisins = nb_voisins_M(colonie, 1, 2, N, M);
	results += (nbVoisins == 5);
	
	nbVoisins = nb_voisins_M(colonie, 2, 0, N, M);
	results += (nbVoisins == 3);
	
	nbVoisins = nb_voisins_M(colonie, 2, 1, N, M);
	results += (nbVoisins == 5);
	
	nbVoisins = nb_voisins_M(colonie, 2, 2, N, M);
	results += (nbVoisins == 3);
	
	colonie_detruire(colonie, N, M);
	
	return results / 9;
}


double tests_generation_suivante_M(void)
{
	double results = 0;
	
	int i, j;
	int **colonie = colonie_creer(N, M);
	int **colonieAn1 = colonie_creer(N, M);
	int **colonieAn2 = colonie_creer(N, M);
	int B[9] = { 0, 1, 0, 0, 0, 0, 0, 0, 1 }; // 1 ou 8 voisin = vivre !
	int S[9] = { 0 }; // ne jamais survivre
	
	colonie[1][1] = CELLULE_VIVANTE;
	
	generation_suivante_M(colonie, colonieAn1, N, M, B, S);
	for (i = 0; i < N; i++)
	{
		for (j = 0; j < M; j++)
		{
			if (i == 1 && 1 == j)
				results += (colonieAn1[i][j] == CELLULE_MORTE);
			else
				results += (colonieAn1[i][j] == CELLULE_VIVANTE);
		}
	}
	
	generation_suivante_M(colonieAn1, colonieAn2, N, M, B, S);
	for (i = 0; i < N; i++)
	{
		for (j = 0; j < M; j++)
		{
			if (i == 1 && 1 == j)
				results += (colonieAn2[i][j] == CELLULE_VIVANTE);
			else
				results += (colonieAn2[i][j] == CELLULE_MORTE);
		}
	}
	
	colonie_detruire(colonie, N, M);
	colonie_detruire(colonieAn1, N, M);
	colonie_detruire(colonieAn2, N, M);
	
	return results / ((N*M)*2);
}

// Neumann
double tests_nb_voisins_N(void)
{
	double results = 0;
	
	int i, j;
	int nbVoisins = 0;
	int **colonie = colonie_creer(N, M);
	
	for (i = 0; i < N; i++)
		for (j = 0; j < M; j++)
			colonie[i][j] = CELLULE_VIVANTE;
	
	nbVoisins = nb_voisins_N(colonie, 0, 0, N, M);
	results += (nbVoisins == 2);
	
	nbVoisins = nb_voisins_N(colonie, 0, 1, N, M);
	results += (nbVoisins == 3);
	
	nbVoisins = nb_voisins_N(colonie, 0, 2, N, M);
	results += (nbVoisins == 2);
	
	nbVoisins = nb_voisins_N(colonie, 1, 0, N, M);
	results += (nbVoisins == 3);
	
	nbVoisins = nb_voisins_N(colonie, 1, 1, N, M);
	results += (nbVoisins == 4);
	
	nbVoisins = nb_voisins_N(colonie, 1, 2, N, M);
	results += (nbVoisins == 3);
	
	nbVoisins = nb_voisins_N(colonie, 2, 0, N, M);
	results += (nbVoisins == 2);
	
	nbVoisins = nb_voisins_N(colonie, 2, 1, N, M);
	results += (nbVoisins == 3);
	
	nbVoisins = nb_voisins_N(colonie, 2, 2, N, M);
	results += (nbVoisins == 2);
	
	colonie_detruire(colonie, N, M);
	
	return results / 9;
}


double tests_generation_suivante_N(void)
{
	double results = 0;
	
	int i, j;
	int **colonie = colonie_creer(N, M);
	int **colonieAn1 = colonie_creer(N, M);
	int **colonieAn2 = colonie_creer(N, M);
	int B[5] = { 0, 1, 0, 0, 1}; // 1 ou 4 voisin(s) = vivre !
	int S[5] = { 0 }; // ne jamais survivre
	
	colonie[1][1] = CELLULE_VIVANTE;
	
	generation_suivante_N(colonie, colonieAn1, N, M, B, S);
	for (i = 0; i < N; i++)
	{
		for (j = 0; j < M; j++)
		{
			if (i == j || (i == 0 && j == 2) || (i == 2 && j == 0))
				results += (colonieAn1[i][j] == CELLULE_MORTE);
			else
				results += (colonieAn1[i][j] == CELLULE_VIVANTE);
		}
	}
	
	
	generation_suivante_N(colonieAn1, colonieAn2, N, M, B, S);
	for (i = 0; i < N; i++)
	{
		for (j = 0; j < M; j++)
		{
			if (i == 1 && 1 == j)
				results += (colonieAn2[i][j] == CELLULE_VIVANTE);
			else
				results += (colonieAn2[i][j] == CELLULE_MORTE);
		}
	}
	
	colonie_detruire(colonie, N, M);
	colonie_detruire(colonieAn1, N, M);
	colonie_detruire(colonieAn2, N, M);
	
	return results / ((N*M)*2);
}

// Fantômes
double tests_generation_suivante_Fantome(void)
{
	double results = 0;
	
	int i, j;
	int **colonie = colonie_creer(N, M);
	int **colonieAn1 = colonie_creer(N, M);
	int **colonieAn2 = colonie_creer(N, M);
	int B[9] = { 0, 1, 0, 0, 0, 0, 0, 0, 1 }; // 1 ou 8 voisin = vivre !
	int S[9] = { 0 }; // ne jamais survivre
	
	colonie[1][1] = CELLULE_VIVANTE;
	
	generation_suivante_Fantome(colonie, colonieAn1, N, M, B, S);
	for (i = 0; i < N; i++)
	{
		for (j = 0; j < M; j++)
		{
			if (i == 1 && 1 == j)
				results += (colonieAn1[i][j] == CELLULE_FANTOME);
			else
				results += (colonieAn1[i][j] == CELLULE_VIVANTE);
		}
	}
	
	
	generation_suivante_Fantome(colonieAn1, colonieAn2, N, M, B, S);
	for (i = 0; i < N; i++)
	{
		for (j = 0; j < M; j++)
		{
			if (i == 1 && 1 == j)
				results += (colonieAn2[i][j] == CELLULE_MORTE);
			else
				results += (colonieAn2[i][j] == CELLULE_FANTOME);
		}
	}
	
	colonie_detruire(colonie, N, M);
	colonie_detruire(colonieAn1, N, M);
	colonie_detruire(colonieAn2, N, M);
	
	return results / ((N*M)*2);
}
