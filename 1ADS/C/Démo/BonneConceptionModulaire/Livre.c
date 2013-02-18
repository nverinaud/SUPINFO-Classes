//
//  Livre.c
//  Sandbox
//
//  Created by Nicolas VERINAUD on 17/01/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "Livre.h"

LivreRef LivreCreate(char *titre, char *nom, int annee)
{
	LivreRef livre = malloc(sizeof(struct Livre));
	strcpy(livre->titre, titre);
	strcpy(livre->nom, nom);
	livre->annee = annee;
	
	return livre;
}


void LivreSetTitre(LivreRef livre, const char *titre)
{
	strcpy(livre->titre, titre);
}
























