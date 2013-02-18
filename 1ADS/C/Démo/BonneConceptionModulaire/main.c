
#include <stdio.h>
#include <stdlib.h>
#include "Livre.h"
#include "Etudiant.h"

int main()
{
	LivreRef livre = LivreCreate("Hello", "World", 1990);
	
	printf("Titre: %s", livre->titre);
	
	LivreSetTitre(livre, "Salut");
	
	printf("\nTitre: %s", livre->titre);
	
	EtudiantRef etudiant = EtudiantCreate("John", 67666);
	
	etudiant->livrePrefere = livre;
	
	printf("\nTitre du livre prefere: %s", etudiant->livrePrefere->titre);
	
	free(etudiant);
	free(livre);
	
	return 0;
}
















