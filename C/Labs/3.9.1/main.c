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
	
	ListeChaineePrintf(liste);
	
	int valeurRetiree = ListeChaineeRetirerFin(liste);
	printf("Valeur retiree: %d\n", valeurRetiree);
	ListeChaineePrintf(liste);
	
	valeurRetiree = ListeChaineeRetirerDebut(liste);
	printf("Valeur retiree: %d\n", valeurRetiree);
	ListeChaineePrintf(liste);
	
	ListeChaineeDetruire(liste);
	
    return 0;
}

