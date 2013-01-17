//
//  Livre.h
//  Sandbox
//
//  Created by Nicolas VERINAUD on 17/01/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#ifndef Sandbox_Livre_h
#define Sandbox_Livre_h

struct Livre
{
	char titre[30];
	char nom[30];
	int annee;
};
typedef struct Livre *LivreRef;

LivreRef LivreCreate(char *titre, char *nom, int annee);
void LivreSetTitre(LivreRef livre, const char *titre);

#endif
