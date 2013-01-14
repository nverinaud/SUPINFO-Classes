//
//  main.c
//  3.2.2
//
//  Created by Nicolas VERINAUD on 14/01/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
	int a,b,i;
	int somme = 0;
	
	do {
		printf("Saisir a (positif): ");
		scanf("%d", &a);
	} while (a <= 0);
	
	do {
		printf("Saisir b (positif): ");
		scanf("%d", &b);
	} while (b <= 0);
	
	for (i = 1;i <= b ; i++)
	{
		somme += a;
	}
	
	printf("%d ", somme);
	
    return 0;
}

