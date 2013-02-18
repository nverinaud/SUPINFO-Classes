
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "gethome.h"
#include "crypto.h"

int main(int argc, const char * argv[])
{
	int a, b;
	saisir_cle(&a, &b);
	
	char src[256];
	strcpy(src, gethome());
	strcat(src, "/Desktop/clair.txt");
	
	char dst[256];
	strcpy(dst, gethome());
	strcat(dst, "/Desktop/chiffree.txt");
	
	printf("src: %s\n", src);
	printf("dst: %s\n", dst);
	
	FILE *sourceFile = fopen(src, "w");
	if (sourceFile != NULL)
	{
		fputs("Hello World !\n", sourceFile);
		fputs("Comment ça va ?\n", sourceFile);
		fputs("Stay hungry stay foolish !\n", sourceFile);
		fputs("Hi from Strasbourg... :D", sourceFile);
		
		fclose(sourceFile);
		
		chiffrer_fichier(a, b, src, dst);
	}
	else
	{
		printf("Impossible de créer le fichier %s.", src);
	}
	
    return 0;
}















