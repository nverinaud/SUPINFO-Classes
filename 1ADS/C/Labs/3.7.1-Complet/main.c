//
//  main.c
//  Lab58
//
//  Created by Nicolas VERINAUD on 16/11/11.
//

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "crypto.h"

int main (int argc, const char * argv[])
{
	int a, b;
	char phrase1[50];
	char* phrase2;
	char* phrase3;
	
	printf("Saisir la phrase à chiffrer: ");
	
	gets(phrase1);
	
	saisir_cle(&a, &b);
	
	phrase2 = chiffrer_phrase(a, b, phrase1);
	
	printf("\nPhrase Chiffree: %s\n", phrase2);
	
	phrase3 = dechiffrer_phrase(a, b, phrase2);
	
	printf("\nPhrase Dechiffree: %s\n", phrase3);
		
	free(phrase2);
	free(phrase3);
	
	printf("\n");
    return 0;
}

