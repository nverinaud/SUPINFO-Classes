//
//  ListeChainee.c
//  3.9.1
//
//  Created by Nicolas VERINAUD on 18/01/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include "ListeChainee.h"

ListeChainee *ListeChaineeCreer(void)
{
	ListeChainee *liste = malloc(sizeof(ListeChainee));
	liste->taille = 0;
	liste->premier = NULL;
	return liste;
}


void ListeChaineeDetruire(ListeChainee *liste)
{
	ListeChaineeMaillon *maillon = liste->premier;
	ListeChaineeMaillon *suivant = NULL;
	
	while (maillon != NULL)
	{
		suivant = maillon->suivant;
		free(maillon);
		maillon = suivant;
	}
	
	free(liste);
}


int ListeChaineeGetTaille(ListeChainee *liste)
{
	return liste->taille;
}


ListeChaineeMaillon *ListeChaineeGetPremierMaillon(ListeChainee *liste)
{
	return liste->premier;
}


void ListeChaineeAjouterAuDebut(ListeChainee *liste, int valeur)
{	
	ListeChaineeMaillon *premierCourant = liste->premier;
	if (premierCourant == NULL)
	{
		ListeChaineeMaillon *maillon = malloc(sizeof(ListeChaineeMaillon));
		maillon->valeur = valeur;
		maillon->suivant = NULL;
		liste->premier = maillon;
	}
	else
	{
		ListeChaineeMaillon *maillon = malloc(sizeof(ListeChaineeMaillon));
		maillon->valeur = valeur;
		maillon->suivant = premierCourant;
		liste->premier = maillon;
	}
	
	liste->taille++;
}

void ListeChaineeAjouterFin(ListeChainee *liste, int valeur)
{
	if (liste->premier == NULL)
	{
		ListeChaineeAjouterAuDebut(liste, valeur);
	}
	else
	{
		ListeChaineeMaillon *maillon = malloc(sizeof(ListeChaineeMaillon));
		maillon->suivant = NULL;
		maillon->valeur = valeur;
		
		ListeChaineeMaillon *dernier = liste->premier;
		
		while (dernier->suivant != NULL)
			dernier = dernier->suivant;
		
		dernier->suivant = maillon;
		
		liste->taille++;
	}
}


void ListeChaineePrintf(ListeChainee *liste)
{
	ListeChaineeMaillon *maillon = liste->premier;
	
	printf("<ListeChainee %p> [%d]", liste, liste->taille);
	
	if (liste->premier != NULL)
		printf(" (\n\t");
		
	while (maillon != NULL)
	{
		printf("%d", maillon->valeur);
		if (maillon->suivant != NULL)
			printf(",\n\t");
		
		maillon = maillon->suivant;
	}
	
	if (liste->premier != NULL)
		printf("\n)");
	
	printf("\n");
}


int ListeChaineeRetirerDebut(ListeChainee *liste, int *valeurRetiree)
{	
	if (liste->premier != NULL)
	{
		ListeChaineeMaillon *ancienPremier = liste->premier;
		
		if (valeurRetiree != NULL)
			*valeurRetiree = ancienPremier->valeur;
		
		if (ancienPremier->suivant != NULL)
			liste->premier = ancienPremier->suivant;
		else
			liste->premier = NULL;
		
		free(ancienPremier);
		liste->taille--;
	}
	
	return liste->taille > 0;
}



int ListeChaineeRetirerFin(ListeChainee *liste, int *valeurRetiree)
{	
	if (liste->premier != NULL)
	{
		ListeChaineeMaillon *dernier = liste->premier;
		ListeChaineeMaillon *avantDernier = dernier;
		
		while (dernier->suivant != NULL)
		{
			avantDernier = dernier;
			dernier = dernier->suivant;
		}
		
		if (valeurRetiree != NULL)
			*valeurRetiree = dernier->valeur;
		
		avantDernier->suivant = NULL;
		
		free(dernier);
		
		liste->taille--;
	}
	
	return liste->taille > 0;
}


void ListeChaineeInserer(ListeChainee *liste, ListeChaineeMaillon *apres, int valeur)
{
	ListeChaineeMaillon *suivant = apres->suivant;
	
	ListeChaineeMaillon *aInserer = malloc(sizeof(ListeChaineeMaillon));
	aInserer->valeur = valeur;
	aInserer->suivant = suivant;
	
	apres->suivant = aInserer;
	
	liste->taille++;
}


int ListeChaineeRetirer(ListeChainee *liste, ListeChaineeMaillon *aRetirer, int *valeurRetiree)
{
	ListeChaineeMaillon *suivant = aRetirer->suivant;
	if (valeurRetiree != NULL)
		*valeurRetiree = aRetirer->valeur;
	
	ListeChaineeMaillon *precedent = liste->premier;
	while (precedent->suivant != aRetirer)
		precedent = precedent->suivant;
	
	precedent->suivant = suivant; // Celui d'avant doit pointer sur celui d'après
	
	liste->taille--;
	return liste->taille > 0;
}



























