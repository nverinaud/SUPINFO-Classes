
#include <stdio.h>
#include <time.h>
#include <stdlib.h>

int main(int argc, const char * argv[])
{
	int i,x;
	int tab[8];
	
	srand(time(NULL));
	printf("Octet de base : \n");
	for (i=0; i<8; i++)
	{
		x=rand()%2;
		tab[i]=x;
		printf("%d",tab[i]);
	}
	printf("\n");
	printf("Octet shifté : \n");
	printf("%d",tab[0]);
	for (i=0; i<7; i++)
	{
		printf("%d",tab[i]);
	}
	
    return 0;
}

