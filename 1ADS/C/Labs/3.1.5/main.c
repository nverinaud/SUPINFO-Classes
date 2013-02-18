//
//  main.c
//  Lab41
//
//  Created by Nicolas VERINAUD on 13/11/11.
//

#include <stdio.h>

int main (int argc, const char * argv[])
{
	int numberOfLines = 0;
	int compteurLine = 0;
	int compteurSpace = 0;
	int maxStarsOnOneLine = 0;
	int numberOfSpacesBefore = 0;
	int numberOfSpacesBeforeAndAfter = 0;
	int numberOfStarsToDraw = 0;
	
	printf("Entrez un nombre de lignes: ");
	
	while (numberOfLines <= 0) 
	{
		scanf("%d", &numberOfLines);
	}
	
	printf("\n");
	
	maxStarsOnOneLine = numberOfLines * 2 - 1;
	
	for (compteurLine = 1; compteurLine <= numberOfLines; compteurLine++) 
	{
		numberOfSpacesBefore = numberOfLines - compteurLine;
		
		for (compteurSpace = 0; compteurSpace < numberOfSpacesBefore; compteurSpace++) 
		{
			printf(" ");
		}
		
		numberOfSpacesBeforeAndAfter = numberOfSpacesBefore * 2;
		
		numberOfStarsToDraw = maxStarsOnOneLine - numberOfSpacesBeforeAndAfter;
		
		while (numberOfStarsToDraw > 0)
		{
			printf("*");
			numberOfStarsToDraw--;
		}
		
		printf("\n");
	}
	
	printf("\n");
    return 0;
}

