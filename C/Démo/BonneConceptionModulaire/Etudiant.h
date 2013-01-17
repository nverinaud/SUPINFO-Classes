//
//  Etudiant.h
//  Sandbox
//
//  Created by Nicolas VERINAUD on 17/01/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#ifndef Sandbox_Etudiant_h
#define Sandbox_Etudiant_h

#include "Livre.h"

struct Etudiant
{
	char nom[30];
	int idBooster;
	LivreRef bibliotheques[15];
	LivreRef livrePrefere;
};
typedef struct Etudiant *EtudiantRef;

EtudiantRef EtudiantCreate(char *nom, int idBooster);


#endif
