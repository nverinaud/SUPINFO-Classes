//
//  main.c
//  3.1.4
//
//  Created by Nicolas VERINAUD on 14/01/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
	int nombreDeLignes, nombreEtoiles, i;
	
	do
	{
		printf("Entrez un entier positif: ");
		scanf("%d", &nombreDeLignes);
	}
	while (nombreDeLignes <= 0);
	
	for (i=nombreDeLignes; i>=1; i--)
	{
		for (nombreEtoiles=1; nombreEtoiles<=i; nombreEtoiles++)
		{
			printf("*");
		}
		printf("\n");
	}
	
    return 0;
}

