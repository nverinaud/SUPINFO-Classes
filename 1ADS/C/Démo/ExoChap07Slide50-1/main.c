#include <stdio.h>

int main(int argc, const char * argv[])
{
	int sum = 0;
	int i;
	int userEntry;
	
	do
	{
		printf("Entrez un nombre positif: ");
		scanf("%d", &userEntry);
	}
	while (userEntry < 0);
	
	for (i = 1; i <= userEntry; i++)
	{
		sum += i;
	}
	
	printf("La somme vaut: %d\n", sum);
	
    return 0;
}

