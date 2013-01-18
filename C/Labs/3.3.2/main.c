
#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char * argv[])
{
	int i, a;
	int tab[10];
	
	for (i = 0; i < 10; i++)
	{
		printf("entrer %d : ", i+1);
		scanf("%d", &tab[i]);
	}
	
	for (i = 0; i < 10; i++)
		printf("%d ", tab[i]);
	
	printf("\n");
	
	for (i = 0; i <= 4; i++)
	{
		a = tab[i];
		tab[i] = tab[9-i];
		tab[9-i] = a;
	}
	
	for (i = 0; i < 10; i++)
		printf("%d ", tab[i]);
	
	return 0;
}

