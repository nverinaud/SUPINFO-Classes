
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "chiffrageAffine.h"

int main(int argc, const char * argv[])
{
	int a, b;
	char phrase[50];
	
	printf("Phrase a chiffrer: ");
	gets(phrase);
	
	saisir_cle(&a, &b);
	
	char *phraseChiffree = chiffrer_phrase(a, b, phrase);
	
	printf("Phrase chiffree: %s", phraseChiffree);
	
	free(phraseChiffree);
	
    return 0;
}

