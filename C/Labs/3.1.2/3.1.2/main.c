//
//  main.c
//  Lab38
//
//  Created by Nicolas VERINAUD on 11/11/11.
//

#include <stdio.h>

int main (int argc, const char * argv[])
{
	double somme = 0;
	double produit = 1;
	int numberOfValuesRequested = 0;
	double userEntry = 0;
	int i;
	
	do 
	{
		printf("Entrez le nombre de valeurs souhaitees: ");
		scanf("%d", &numberOfValuesRequested);
	} 
	while (numberOfValuesRequested <= 0);
	
	for (i = 0; i < numberOfValuesRequested; i++) 
	{
		printf("Entrez une valeur: ");
		scanf("%lf", &userEntry);
		
		somme += userEntry;
		produit *= userEntry;
	}
	
	printf("La somme vaut: %lf\n", somme);
	printf("La moyenne vaut: %lf", somme/i);
	printf("Le produit vaut: %lf\n", produit);
	
	printf("\n");
    return 0;
}

