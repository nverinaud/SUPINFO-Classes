
#include <stdio.h>

void saisir(int *n)
{
	printf("Saisissez un entier: ");
	scanf("%d", n);
}


int main(int argc, const char * argv[])
{
	int n = 0;
	saisir(&n);
	
	printf("n = %d", n);
	
    return 0;
}

