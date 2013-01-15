//
//  main.c
//  ExemplesSlide08
//
//  Created by Nicolas VERINAUD on 14/01/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
	// Slide 10 - Recherche du minimum d'un tableau
//	int tab[5];
//	int i, min;
//	
//	for (i = 0; i < 5; i++)
//	{
//		printf("Entrez la valeur numéro %d: ", i+1);
//		scanf("%d", &tab[i]);
//	}
//	
//	min = tab[0];
//	
//	for (i = 1; i < 5; i++)
//	{
//		if (tab[i] < min)
//		{
//			min = tab[i];
//		}
//	}
//	
//	printf("Le minimum dans le tableau est: %d", min);
	
	
	
	// Slide 18 - Calcul du produit d'une matrice par un réel
	double multiplicateur;
	int j, k;
	double matrice[3][4], resultat[3][4];
	
	printf("Entrez la valeur du multiplicateur: ");
	scanf("%lf", &multiplicateur);
	
	// Saisi des valeurs et calcul du resultat
	for (j = 0; j < 3; j++)
	{
		for (k = 0; k < 4; k++)
		{
			printf("Entrez une valeur pour [%d][%d]: ", j+1, k+1);
			scanf("%lf", &matrice[j][k]);
			resultat[j][k] = multiplicateur * matrice[j][k];
		}
	}
	
	// Affichage de la matrice resultat
	for (j = 0; j < 3; j++)
	{
		for (k = 0; k < 4; k++)
		{
			printf("%3.2f\t", resultat[j][k]);
		}
		printf("\n");
	}
	
    return 0;
}





