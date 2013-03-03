//
//  VoisinageUtils.c
//  AutomatesCellulaires
//
//  Created by Nicolas VERINAUD on 03/03/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include "VoisinageUtils.h"

/*
 BONUS: quelques fonctions bien pratiques.
 
 @param n nombre de lignes
 @param m nombre de colonnes
 @return (int**) une nouvelle colonie (tableau à 2 dimensions) allouée dynamiquement
 */

int **colonie_creer(int n, int m)
{
	int i, j;
	int **colonie = calloc(n, sizeof(int*)); // équivalent à malloc(n * sizeof(int*))
	for (i = 0; i < n; i++)
		colonie[i] = calloc(m, sizeof(int));
	
	for (i = 0; i < n; i++)
		for (j = 0; j < m; j++)
			colonie[i][j] = 0;
	
	return colonie;
}


/*
 Détruit une colonie, libère la mémoire.
 
 @param colonie la colonie à détruire
 @param n nombre de lignes
 @param m nombre de colonnes
 */
void colonie_detruire(int **colonie, int n, int m)
{
	int i;
	for (i = 0; i < n; i++)
		free(colonie[i]);
	free(colonie);
}