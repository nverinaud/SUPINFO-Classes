//
//  main.c
//  3.9.1
//
//  Created by Nicolas VERINAUD on 18/01/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include "ListeChainee.h"

#define TAILLE_LISTE 5

int main(int argc, const char * argv[])
{
	ListeChainee *liste = ListeChaineeCreer();
	
	int i;
	for (i = 0; i < TAILLE_LISTE; i++)
	{
		if (i%2 == 0)
			ListeChaineeAjouterAuDebut(liste, i);
		else
			ListeChaineeAjouterFin(liste, i);
	}
	
	printf("-- Apres Insertion --\n");
	ListeChaineePrintf(liste);
	
	int valeurRetiree;
	ListeChaineeRetirerFin(liste, &valeurRetiree);
	printf("-- Apres Retrait a la fin --\n");
	printf("Valeur retiree: %d\n", valeurRetiree);
	ListeChaineePrintf(liste);
	
	ListeChaineeRetirerDebut(liste, &valeurRetiree);
	printf("-- Apres Retrait au debut --\n");
	printf("Valeur retiree: %d\n", valeurRetiree);
	ListeChaineePrintf(liste);
	
	ListeChaineeMaillon *maillon = liste->premier->suivant;
	ListeChaineeRetirer(liste, maillon, &valeurRetiree);
	printf("-- Apres Retirer --\n");
	printf("Valeur retiree: %d\n", valeurRetiree);
	ListeChaineePrintf(liste);
	
	printf("-- Apres Inserer --\n");
	ListeChaineeInserer(liste, liste->premier, 10);
	ListeChaineePrintf(liste);
	
	
	ListeChaineeDetruire(liste);
	
    return 0;
}


















