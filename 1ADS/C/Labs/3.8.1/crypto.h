//
//  crypto.h
//  Lab58
//
//  Created by Nicolas VERINAUD on 16/11/11.
//

#ifndef Lab58_crypto_h
#define Lab58_crypto_h

void saisir_cle(int*,int*);
/*
 Retourne une chaîne allouée dynamiquement.
 Vous êtes responsable de la libération de le mémoire de la chaîne retournée.
 */
char* chiffrer_phrase(int,int,char*);
/*
 Retourne une chaîne allouée dynamiquement.
 Vous êtes responsable de la libération de le mémoire de la chaîne retournée.
 */
char* dechiffrer_phrase(int,int,char*);


/* Gestion des fichiers */
void chiffrer_fichier(int a, int b, const char *source, const char *destination);
void dechiffrer_fichier(int a, int b, const char *source, const char *destination);
#endif


























