
#include <stdio.h>

int main(int argc, const char * argv[])
{
	int n;
	printf("Entrez un nombre de jours (28, 29, 30 ou 31) ");
	scanf("%d", &n);
	
	switch (n)
	{
		case 28 :
		case 29 :
			printf("Février !\n");
			break;
			
		case 30 :
			printf("Avril, Juin, Septembre, Novembre.\n");
			break;
			
		case 31 :
			printf("Janvier, Mars, Mai, Juillet, Août, Octobre, Décembre.\n");
			break;
			
		default:
			printf("Nombre de jours non valide.");
			break;
	}
	
    return 0;
}

