
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, const char * argv[])
{
	srand(time(NULL));
	int matrice[3][4];
	int tab[12];
	int i, j;
	int k = 0;
	
	printf("Voici la matrice :\n");
	
	for (i = 0; i < 3; i++)
	{
		for (j = 0; j < 4; j++)
		{
			matrice[i][j] = rand() % 10 + 1;
			printf("%2d ", matrice[i][j]);
		}
		printf("\n");
	}
	printf("Et voici la matrice aplatie :\n");
	for (i = 0; i < 3; i++)
	{
		for (j = 0; j < 4; j++)
		{
			tab[k] = matrice[i][j];
			k++;
		}
	}
	
	for (i = 0; i < 12; i++)
	{
		printf("%d ", tab[i]);
	}
	
    return 0;
}

