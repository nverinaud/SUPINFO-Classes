//
//  crypto.c
//  Lab58
//
//  Created by Nicolas VERINAUD on 16/11/11.
//

#include "crypto.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h> //http://www.cplusplus.com/reference/clibrary/cctype/

#define ALPHABET_SIZE 26

static char kAlphabet[] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};

// Declaration de Fonctions Cachées

int PGCD(int,int);
int cle_valide(int,int);
char chiffrer_lettre(int,int,char);

// Add-On
char dechiffrer_lettre(int,int,char);
char* newUppercaseStringFromString(const char*);


// Fonctions Publiques

void saisir_cle(int* x, int* b)
{
	printf("Saisissez la cle (2 nombres entiers): ");
	
	/*
	 scanf pose problème, voici pourquoi cette méthode est préférable : http://www.phanderson.com/C/scanf.html
	 */
	char buffer[64];
	do 
	{
		printf("\nx=");
		gets(buffer);
		sscanf(buffer, "%d", x);
		
		printf("b=");
		gets(buffer);
		sscanf(buffer, "%d", b);
		
		if (!cle_valide(*x, *b)) 
		{
			printf("\nCle invalide, recommencez:");
		}
	} 
	while (!cle_valide(*x, *b));
}


char* chiffrer_phrase(int x, int b, char* phrase)
{
	char* phraseUppercase = newUppercaseStringFromString(phrase);
		
	char* phraseChiffree = malloc(strlen(phraseUppercase)+1 * sizeof(char));
	
	int k = 0;
	while (phraseUppercase[k] != '\0') 
	{
		phraseChiffree[k] = chiffrer_lettre(x, b, phraseUppercase[k]);
		k++;
	}
	phraseChiffree[k] = '\0'; // Ne pas oublier le caractère de fin de chaîne !!!
	
	free(phraseUppercase);
		
	return phraseChiffree;
}


char* dechiffrer_phrase(int x, int b, char* phrase)
{
	char* phraseDechiffree = malloc(strlen(phrase)+1 * sizeof(char));
	
	int k = 0;
	while (phrase[k] != '\0') 
	{
		phraseDechiffree[k] = dechiffrer_lettre(x, b, phrase[k]);
		k++;
	}
	
	phraseDechiffree[k] = '\0'; // Ne pas oublier le caractère de fin de chaîne !!!
	
	return phraseDechiffree;
}


// Fonctions Privées

int PGCD(int a, int b)
{
	int reste = 0;
	
	do 
	{
		reste = a % b;
		
		if (reste == 0)
			break;
		
		a = b;
		b = reste;
	}
	while (reste > 0);
	
	return b;
}


int cle_valide(int a, int b)
{
	int result = 0;
	
	if (a > 0 && PGCD(a, ALPHABET_SIZE) == 1)
		result = 1;
	
	return result;
}


char chiffrer_lettre(int x, int b, char lettre)
{
	int indexOfLetterInAlphabet = lettre - 'A';
	int y = (indexOfLetterInAlphabet * x + b) % ALPHABET_SIZE;
	return kAlphabet[y];
}



// Add-On

char dechiffrer_lettre(int x, int b, char lettre)
{
	int k;
	// Recherche du premier diviseur
	for (k = 1; k < ALPHABET_SIZE; k++) 
	{
		if ( ((x * k) % ALPHABET_SIZE) == 1 )
		{
			break;
		}
	}
		
	int indexOfLetterInAlphabet = lettre - 'A';
	int index = (k * (indexOfLetterInAlphabet - b)) % ALPHABET_SIZE;
	
	// On ne peut pas avoir un index négatif, donc on ajoute simplement 26 pour obtenir l'index correct correspondant.
	if (index < 0)
		index += ALPHABET_SIZE;
		
	return kAlphabet[index];
}


char* newUppercaseStringFromString(const char* str)
{
	char* uppercasedStr = malloc(strlen(str)+1 * sizeof(char));
	
	int k = 0; // Index de parcours de la chaîne originale
	int i = k; // Index dans la nouvelle chaîne
	char evaluatedChar;
	while ( (evaluatedChar = str[k]) != '\0') 
	{
		if (isalpha(evaluatedChar)) // http://www.cplusplus.com/reference/clibrary/cctype/isalpha/
		{
			uppercasedStr[i] = toupper(evaluatedChar); // http://www.cplusplus.com/reference/clibrary/cctype/toupper/
			i++;
		}
		
		k++;
	}
	uppercasedStr[i] = '\0';
	
	return uppercasedStr;
}

