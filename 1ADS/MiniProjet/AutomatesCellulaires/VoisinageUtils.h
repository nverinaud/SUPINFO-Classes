//
//  VoisinageUtils.h
//  AutomatesCellulaires
//
//  Created by Nicolas VERINAUD on 03/03/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#ifndef AutomatesCellulaires_VoisinageUtils_h
#define AutomatesCellulaires_VoisinageUtils_h

/*
 Une cellule morte est représentée par un 0.
 Une cellule vivante est représentée par un 1.
 */
#define CELLULE_MORTE	0
#define CELLULE_VIVANTE 1

/*
 BONUS: quelques fonctions bien pratiques.
 */
int **colonie_creer(int n, int m); // crée une colonie à n lignes et n colonnes (alloue la mémoire)
void colonie_detruire(int **colonie, int n, int m); // détruit une colonie (libère la mémoire)

#endif
