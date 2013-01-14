//
//  main.c
//  Lab40
//
//  Created by Nicolas VERINAUD on 13/11/11.
//

#include <stdio.h>

int main (int argc, const char * argv[])
{
	int n = 0, m = 0;
	int reste = 0;
	
	printf("Entrez deux nombres positifs: ");
	
	while (n <= 0) 
	{
		scanf("%d", &n);
	}
	
	printf("Calcul du PGCD entre %d et ", n);
	
	while (m <= 0) 
	{
		scanf("%d", &m);
	}
	
	
	do 
	{
		printf("\n%d = %dx + %d", n, m, n%m);
		
		reste = n % m;
		
		if (reste == 0)
			break;
		
		n = m;
		m = reste;
	}
	while (reste > 0);
	
	printf("\nThe PGCD is %d", m);	
	
	printf("\n");
    return 0;
}

