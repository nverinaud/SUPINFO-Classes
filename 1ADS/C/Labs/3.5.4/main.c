
#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char * argv[])
{
	int i=0;
	int j=0;
	int n=0;
	int **tab;
	
	do {
		printf("Entrer un entier strictement positif !\n");
		scanf("%d",&n);
	}
	while (n <= 0);
	
	printf("\n");
	
	tab=malloc(n*sizeof(int*));
	for (i=0; i<n; i++)
	{
		tab[i]=malloc(n*sizeof(int));
	}
	
	for (i=0; i<n; i++)
	{
		for (j=0; j<n; j++)
		{	
			if (i == j)
			{
				tab[i][j]=1;
			}
			else
			{
				tab[i][j]=0;
			}
		}
	}
	for (i=0; i<n; i++)
	{
		for (j=0; j<n; j++)
		{
			printf("%d ",tab[i][j]);
		}
		printf("\n");
	}

	for (i=0; i<n; i++)
	{
		free(tab[i]);
	}
	
	free(tab);
	
	
	
	
	
	
	
	
    return 0;
}















