
#include <stdio.h>
#include <string.h>

#define TAB_SIZE 25 // Anticonstitutionnellement

int main (int argc, const char * argv[])
{
	char saisi[TAB_SIZE];
	char inverse[TAB_SIZE];
	int i;
	char tmp;
	unsigned long stringSize;
	
	printf("Saisissez un mot: ");
	scanf("%25s", &saisi);
	
	strcpy(inverse, saisi); // Initialiser la seconde chaine avec le contenu de la première. (pour éviter les valeurs aléatoires dans la chaine inverse)
		
	stringSize = strlen(saisi);
	
	printf("\nString Size: %ld", stringSize);
	
	for (i = 0; i < stringSize; i++) 
	{
		tmp = saisi[stringSize-i-1];
				
		if (tmp == '\0')
			continue;
		
		inverse[i] = tmp;
	}
	
	printf("\nVotre mot:\t %s", saisi);
	printf("\nSon inverse: %s", inverse);
	printf(strcmp(saisi, inverse) == 0 ? "\nC'est un palindrome." : "\nCe n'est pas un palindrome.");
	
	printf("\n");
    return 0;
}

