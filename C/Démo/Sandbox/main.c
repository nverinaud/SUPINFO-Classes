#include <stdio.h>

int main(int argc, const char * argv[])
{
	// Le problème du tampon
	char c;
	printf("Entrez un caractère: ");
	scanf("%c", &c);
	printf("Vous avez entré: %c\n", c);
	
	while (getchar() != '\n'); // Vidage du tampon
	
	printf("Entrez un autre caractère: ");
	scanf("%c", &c);
	printf("\nVous avez entré: %d\n", c);
	
    return 0;
}

