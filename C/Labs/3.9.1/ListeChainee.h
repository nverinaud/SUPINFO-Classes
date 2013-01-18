//
//  ListeChainee.h
//  3.9.1
//
//  Created by Nicolas VERINAUD on 18/01/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#ifndef __9_1_ListeChainee_h
#define __9_1_ListeChainee_h

struct ListeChaineeMaillon
{
	int valeur;
	struct ListeChaineeMaillon *suivant;
};
typedef struct ListeChaineeMaillon ListeChaineeMaillon;


struct ListeChainee
{
	int taille;
	ListeChaineeMaillon *premier;
};
typedef struct ListeChainee ListeChainee;

ListeChainee *ListeChaineeCreer(void);
void ListeChaineeDetruire(ListeChainee *liste);
int ListeChaineeGetTaille(ListeChainee *liste);
ListeChaineeMaillon *ListeChaineeGetPremierMaillon(ListeChainee *liste);
void ListeChaineeAjouterAuDebut(ListeChainee *liste, int valeur);
void ListeChaineeAjouterFin(ListeChainee *liste, int valeur);

void ListeChaineePrintf(ListeChainee *liste);

#endif

























