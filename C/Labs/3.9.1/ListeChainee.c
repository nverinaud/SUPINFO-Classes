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
	printf("(GetPremierMaillon) Liste: %p\n", liste);
	return liste->premier;
}


void ListeChaineeAjouterAuDebut(ListeChainee *liste, int valeur)
{
	printf("(AjouterAuDebut) Liste: %p\n", liste);
	
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
}
















