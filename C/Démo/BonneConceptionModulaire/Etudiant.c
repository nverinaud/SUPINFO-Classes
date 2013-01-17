//
//  Etudiant.c
//  Sandbox
//
//  Created by Nicolas VERINAUD on 17/01/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "Etudiant.h"

EtudiantRef EtudiantCreate(char *nom, int idBooster)
{
	EtudiantRef etudiant = malloc(sizeof(struct Etudiant));
	strcpy(etudiant->nom, nom);
	etudiant->idBooster = idBooster;
	
	
	
	return etudiant;
}
