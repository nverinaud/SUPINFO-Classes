//
//  chiffrageAffine.c
//  3.7.1
//
//  Created by Nicolas VERINAUD on 17/01/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "chiffrageAffine.h"

int PGCD(int n, int m)
{
	int reste = 0;
	
	do
	{		
		reste = n % m;
		
		if (reste == 0)
			break;
		
		n = m;
		m = reste;
	}
	while (reste > 0);
	
	return m;
}


int cle_valide(int a, int b)
{
	return PGCD(a, 26) == 1;
}


void saisir_cle(int *a, int *b)
{
	do
	{
		printf("Saisissez la cle (a et b): ");
		scanf("%d%d", a, b);
	}
	while (!cle_valide(*a, *b)); // cle_valide(*a, *b) == 0
}


char chiffrer_lettre(int a, int b, char c)
{
	if (97 <= c && c <= 122)
		c -= 32;
	
	if (65 <= c && c <= 90)
		return ((a * (c-65) + b)%26) + 65;
	
	return 0;
}


char *chiffrer_phrase(int a, int b, char *phrase)
{
	char *phraseChiffree = malloc((strlen(phrase)+1) * sizeof(char));
	char c;
	int k = 0;
	int i = 0;
	
	while (phrase[i] != '\0')
	{
		c = chiffrer_lettre(a, b, phrase[i]);
		if (c != 0)
		{
			phraseChiffree[k] = c;
			k++;
		}
		
		i++;
	}
	
	return phraseChiffree;
}


























