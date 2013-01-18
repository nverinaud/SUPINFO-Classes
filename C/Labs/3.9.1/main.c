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

int main(int argc, const char * argv[])
{
	ListeChainee *liste = ListeChaineeCreer();
	
	printf("Liste: %p\n", liste);
	
	ListeChaineeAjouterAuDebut(liste, 1);
	
	ListeChaineeMaillon *premier = ListeChaineeGetPremierMaillon(liste);
	printf("Valeur du premier maillon: %d", premier->valeur);
	
	ListeChaineeDetruire(liste);
	
    return 0;
}

