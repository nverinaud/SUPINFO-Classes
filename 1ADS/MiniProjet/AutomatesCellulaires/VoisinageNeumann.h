//
//  VoisinageNeumann.h
//  AutomatesCellulaires
//
//  Created by Nicolas VERINAUD on 01/02/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#ifndef AutomatesCellulaires_VoisinageNeumann_h
#define AutomatesCellulaires_VoisinageNeumann_h

#include "VoisinageCore.h"

void saisie_B_N(int B[4]);
void saisie_S_N(int S[4]);

int nb_voisins_N(int **tab, int i, int j, int n, int m);
void generation_suivante_N(int **tab1, int **tab2, int n, int m, int B[4], int S[4]);

void jeu_N(int **tab1, int n, int m, int B[4], int S[4], int ng);
void jeu_Neumann_predefini(int **tab1, int n, int m, int ng);


/*
 BONUS
 */
void jeu_N_timing(int **tab1, int n, int m, int B[4], int S[4], int ng, double timing);
void jeu_Neumann_predefini_timing(int **tab1, int n, int m, int ng, double timing);

#endif
