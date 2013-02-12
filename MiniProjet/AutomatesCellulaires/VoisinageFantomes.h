//
//  VoisinageFantomes.h
//  AutomatesCellulaires
//
//  Created by Nicolas VERINAUD on 01/02/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#ifndef AutomatesCellulaires_VoisinageFantomes_h
#define AutomatesCellulaires_VoisinageFantomes_h

// Une cellule fantome est représentée par un 2
#define CELLULE_FANTOME 2

void initialisation_fantome(int **tab, int n, int m);
void affiche_fantome(int **tab, int n, int m);
void affiche_fichier_fantome(int **tab, int n, int m, char *nom);

void generation_suivante_Fantome(int **tab1, int **tab2, int n, int m, int B[9], int S[9]);

void jeu_Fantome(int **tab1, int n, int m, int B[9], int S[9], int ng);
void jeu_brian_silverman(int **tab1, int n, int m, int ng);


/* BONUS */
void jeu_Fantome_timing(int **tab1, int n, int m, int B[9], int S[9], int ng, double timing); // bonus
void jeu_brian_silverman_timing(int **tab1, int n, int m, int ng, double timing); // bonus

#endif
