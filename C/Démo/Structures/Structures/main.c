#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Livre
{
	char titre[30];
	char nom[30];
	int annee;
};
typedef struct Livre Livre;


struct Etudiant
{
	char nom[30];
	int idBooster;
	Livre bibliotheques[15];
	Livre livrePrefere;
};
typedef struct Etudiant Etudiant;


int main()
{
	Etudiant moi;
	strcpy(moi.nom, "Moi");
	moi.idBooster = 75274;
	
	moi.bibliotheques[0].annee = 1900;
	strcpy(moi.bibliotheques[0].titre, "Hello world !");
	
	Livre unSuperLivre;
	moi.livrePrefere = unSuperLivre;
	
	
	return 0;
}
















