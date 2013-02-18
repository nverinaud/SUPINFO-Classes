
#include <stdio.h>

int nbPremier (int a)
{
	if (a<2)
		return 0;
	
	int i;
	for (i = 2; i < a/2; i++)
	{
		if (a%i == 0)
		{
			return 0;
		}
	}
	
	return 1;
}


int main(int argc, const char * argv[])
{
	int x;
	int resultat;
	
	printf("Veuillez entrer un nombre :");
	scanf("%d", &x);
	
	resultat = nbPremier(x);
	
	if (resultat == 1)
		printf("Votre nombre est premier");
	else
		printf("Votre nombre nest pas premier");
	
    return 0;
}

