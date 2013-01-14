//
//  main.c
//  ExoChap07Slide22-1
//
//  Created by Nicolas VERINAUD on 10/01/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
	double a;
	double b;
	
	printf("Entrez deux réels:\n");
	printf("a = ? ");
	scanf("%lf", &a);
	printf("b = ? ");
	scanf("%lf", &b);
	
	printf("Calcul de %.0fx+%.0f=0\n", a, b);
	
	if (a == 0)
	{
		if (b == 0)
		{
			printf("Infinité de solutions.\n");
		}
		else
		{
			printf("Pas de solutions.\n");
		}
	}
	else
	{
		printf("Solution: %.2f", -b/a);
	}
	
    return 0;
}




















