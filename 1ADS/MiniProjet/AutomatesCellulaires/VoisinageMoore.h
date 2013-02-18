//
//  VoisinageMoore.h
//  AutomatesCellulaires
//
//  Created by Nicolas VERINAUD on 28/01/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#ifndef AutomatesCellulaires_VoisinageMoore_h
#define AutomatesCellulaires_VoisinageMoore_h

#include "VoisinageCore.h"

void saisie_B_M(int B[9]);
void saisie_S_M(int S[9]);

int nb_voisins_M(int **tab, int i, int j, int n, int m);
void generation_suivante_M(int **tab1, int **tab2, int n, int m, int B[9], int S[9]);

void jeu_M(int **tab1, int n, int m, int B[9], int S[9], int ng);

void jeu_conway(int **tab1, int n, int m, int ng);
void jeu_fredkin_M(int **tab1, int n, int m, int ng);

/*
 BONUS
 Les fonctions ci-dessous ne sont pas demandées.
 */

// Même fonctionnalité que jeu_M mais avec en plus un délai d'attente entre chaque colonie
// pratique pour voir comment la colonie évolue dans le temps.
// Le timing est le nombre de secondes à attendre entre chaque affichage.
void jeu_M_avec_timing(int **tab1, int n, int m, int B[9], int S[9], int ng, double timing);

void jeu_conway_timing(int **tab1, int n, int m, int ng, double timing);
void jeu_fredkin_M_timing(int **tab1, int n, int m, int ng, double timing);

#endif
