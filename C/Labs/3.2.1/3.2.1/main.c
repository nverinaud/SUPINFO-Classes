//
//  main.c
//  3.2.1
//
//  Created by Nicolas VERINAUD on 14/01/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
	int a, n, i;
	
	printf("Saisir la base de la suite et le nombre de termes voulu :");
	scanf("%d%d", &a, &n);
	
	for (i = n-1; i >= 0; i--)
	{
		printf("%d ", a);
		if (a%2 == 0)
		{
			a /= 2; //a=a/2
		}
		else
		{
			a = 3*a+1;
		}
	}
	
    return 0;
}

