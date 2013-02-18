//
//  VoisinageCore.h
//  AutomatesCellulaires
//
//  Created by Nicolas VERINAUD on 01/02/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#ifndef AutomatesCellulaires_VoisinageCore_h
#define AutomatesCellulaires_VoisinageCore_h

/*
 Je décide de déclarer une structure Coordonnee
 pour que la saisie et l'utilisation des coordonnées
 par l'utilisateur soit plus facile et intuitive par
 la suite.
 */
struct Coordonnee
{
	int x;
	int y;
};
typedef struct Coordonnee Coordonnee;


/*
 Une cellule morte est représentée par un 0.
 Une cellule vivante est représentée par un 1.
 */
#define CELLULE_MORTE	0
#define CELLULE_VIVANTE 1


void dimensionnement(int *n, int *m);
void initialisation(int **tab, int n, int m);
int nb_generations(void);
void affiche(int **tab, int n, int m);
void affiche_fichier(int **tab, int n, int m, char *nom);
void duplication(int **tab1, int **tab2, int n, int m);

/*
 BONUS: quelques fonctions bien pratiques.
 */
int **colonie_creer(int n, int m); // crée une colonie à n lignes et n colonnes (alloue la mémoire)
void colonie_detruire(int **colonie, int n, int m); // détruit une colonie (libère la mémoire)

#endif
