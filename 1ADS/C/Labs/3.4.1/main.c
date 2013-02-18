//
//  main.c
//  Lab47
//
//  Created by Nicolas Verinaud on 15/11/11.
//

#include <stdio.h>

#define TAB_SIZE 100

int main (int argc, const char * argv[])
{
	int tab[TAB_SIZE];
	int i;
	
	for (i = 0; i < TAB_SIZE; i++) 
		tab[i] = i;
	
	printf("Affichage des 100 premiers entiers:");
	for (i = 0; i < TAB_SIZE; i++) 
	{
		if (i%10 == 0)
			printf("\n");
		
		printf("%3d", tab[i]);
	}	
	
	// Crible d'Ératosthène
	int lastDivider = 2;
	int k;
	
	for (i = 0; i < TAB_SIZE; i++) 
	{
		switch (tab[i]) 
		{
			case 0:
				continue;
				break;
				
			case 1:
				tab[i] = 0;
				continue;
				break;
				
			default:
				break;
		}
		
		for (k = lastDivider; k < TAB_SIZE; k++) 
		{
			if (tab[k] == lastDivider)
				continue;
			
			if (tab[k] % lastDivider == 0) 
				tab[k] = 0;
		}
		
		lastDivider++;
	}
	
	printf("\n\nSuppression des nombres non premiers:");
	for (i = 0; i < TAB_SIZE; i++) 
	{
		if (i%10 == 0)
			printf("\n");
		
		if (tab[i] == 0) 
			printf(".. ");
		else
			printf("%2d ", tab[i]);
	}
	
	printf("\n\nLes nombres premiers entre 0 et 100 sont:\n");
	for (i = 0; i < TAB_SIZE; i++) 
	{		
		if (tab[i] == 0) 
			continue;
		
		printf("%d ", tab[i]);
	}
	
	printf("\n");
    return 0;
}

