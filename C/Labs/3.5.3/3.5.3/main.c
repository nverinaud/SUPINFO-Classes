
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, const char * argv[])
{
	int n;
	
	do {
		printf("Saisir un entier : ");
		scanf("%d", &n);
	} while (n <= 0);
	
	int *tab;
	tab=malloc(n*sizeof(int));
	
	srand(time(NULL));
	
	int i;
	for (i=0; i<n; i++)
	{
		tab[i]=rand()%2;
		printf("%d", tab[i]);
	}
	
	printf("\n");
	
	int nombreDeZero=0;
	int nombreDeUn=0;
	
	for (i=0; i<n; i++)
	{
		if (tab[i]==0)
			nombreDeZero++;
		else
			nombreDeUn++;
	}
	
	printf("Il y a %d un, et %d zero.", nombreDeUn,nombreDeZero);
	
	free(tab);
	
    return 0;
}
