//
//  chiffrageAffine.h
//  3.7.1
//
//  Created by Nicolas VERINAUD on 17/01/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#ifndef __7_1_chiffrageAffine_h
#define __7_1_chiffrageAffine_h

int PGCD(int n, int m);
int cle_valide(int a, int b);
void saisir_cle(int *a, int *b);
char chiffrer_lettre(int a, int b, char c);
char *chiffrer_phrase(int a, int b, char *phrase); // Vous devez free la chaîne retournée !!

#endif
