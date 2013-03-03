//
//  VoisinageTests.c
//  AutomatesCellulaires
//
//  Created by Nicolas VERINAUD on 01/02/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#include <stdio.h>
#include "VoisinageUtils.h"
#include "VoisinageMoore.h"
#include "VoisinageNeumann.h"
#include "VoisinageFantomes.h"

void test_1_FP(void)
{
	int **colonie = NULL;
	int lignes = 20, colonnes = 50;
	int BMoore[9] = { 0, 0, 0, 1, 0, 0, 0, 0, 0 };
	int SMoore[9] = { 0, 0, 1, 1, 0, 0, 0, 0, 0 };
	int nbGenerationsVoulues = 41;
	
	colonie = colonie_creer(lignes, colonnes);
	
	colonie[5][3] = 1;
	colonie[5][2] = 1;
	colonie[5][4] = 1;
	colonie[4][4] = 1;
	colonie[3][3] = 1;
	
	jeu_M_avec_timing(colonie, lignes, colonnes, BMoore, SMoore, nbGenerationsVoulues, 1./3);
	
	// Ne pas oublier de libérer la mémoire allouée pour notre colonie !
	colonie_detruire(colonie, lignes, colonnes);
}


void test_live(void)
{
	int **colonie = NULL;
	int lignes = 0, colonnes = 0;
	int BMoore[9], SMoore[9];
	int nbGenerationsVoulues = 0;
	
	dimensionnement(&lignes, &colonnes);
	
	colonie = colonie_creer(lignes, colonnes);
	
	initialisation(colonie, lignes, colonnes);
	
	nbGenerationsVoulues = nb_generations();
	
	saisie_B_M(BMoore);
	saisie_S_M(SMoore);
	
	jeu_M(colonie, lignes, colonnes, BMoore, SMoore, nbGenerationsVoulues);
	
	// Ne pas oublier de libérer la mémoire allouée pour notre colonie !
	colonie_detruire(colonie, lignes, colonnes);
}


/*
 BONUS de haut niveau.
 */

/* 
 Création d'un pointeur de fonction appelé jeu_timing_ref transformé en type avec typedef
 on crée ainsi une signature de fonction utilisable comme un type classique. Ainsi on peut créer
 une variable de type jeu_timing_ref qui va pouvoir contenir l'adresse d'une fonction ayant la signature
 `void (int**, int, int, int, double)`
*/
typedef void (*jeu_timing_ref)(int **colonie, int n, int m, int ng, double timing);

/* 
 Cette fonction effectue les opérations communes à tous les jeux à savoir:
	- dimensionner la colonie
	- créer une colonie de la bonne dimension
	- initialiser la colonie avec les cellules vivantes de départ
	- demander le nombre de générations voulu
	- detruire la colonie.
 
 Cette fonction va exécuter la fonction passée en paramètre, ainsi on factorise mieux le code
 et comme on est des gros fénéants et que le copier-coller c'est mal, avec cette solution on
 est des beaux gosses :D
 
 Je vous encourage à tester / comprendre les pointeurs de fonctions si vous voulez en savoir plus sur le C.
 http://www.siteduzero.com/informatique/tutoriels/les-pointeurs-sur-fonctions-1
*/
void jeu_timing_generique(jeu_timing_ref jeu);


void test_conway(void)
{
	jeu_timing_generique(&jeu_conway_timing);
}


void test_fredkin(void)
{
	jeu_timing_generique(&jeu_fredkin_M_timing);
}


void test_neuman_predefini(void)
{
	jeu_timing_generique(&jeu_Neumann_predefini_timing);
}


void test_brian_silverman(void)
{
	int **colonie = NULL;
	int n = 0, m = 0;
	int ng = 0;
	
	dimensionnement(&n, &m);
	colonie = colonie_creer(n, m);
	initialisation_fantome(colonie, n, m);
	ng = nb_generations();
	
	jeu_brian_silverman_timing(colonie, n, m, ng, 1./3);
	
	colonie_detruire(colonie, n, m);
}


void test_brian_silverman_predefini(void)
{
	int **colonie = NULL;
	int n = 13, m = 13;
	int ng = 4;
	
	colonie = colonie_creer(n, m);
	
	// Cellules vivantes
	colonie[5][5] = 1;
	colonie[5][6] = 1;
	colonie[6][5] = 1;
	colonie[6][6] = 1;
	
	// Cellules fantômes
	colonie[4][5] = 2;
	colonie[5][7] = 2;
	colonie[6][4] = 2;
	colonie[7][6] = 2;

	printf("-- Jeu Brian Silvermann predefini --\n");
	jeu_brian_silverman_timing(colonie, n, m, ng, 1./3);
	
	colonie_detruire(colonie, n, m);
}



void jeu_timing_generique(jeu_timing_ref jeu)
{
	int **colonie = NULL;
	int n = 0, m = 0;
	int ng = 0;
	
	dimensionnement(&n, &m);
	colonie = colonie_creer(n, m);
	initialisation(colonie, n, m);
	ng = nb_generations();
	
	jeu(colonie, n, m, ng, 1./3);
	
	colonie_detruire(colonie, n, m);
}




