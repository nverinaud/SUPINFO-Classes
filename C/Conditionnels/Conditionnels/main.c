//
//  main.c
//  Conditionnels
//
//  Created by Nicolas VERINAUD on 10/01/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
	// Note avec if...else if...else
	double note;
	scanf("%lf", &note);

	if (note < 8)
	{
		printf("Recalé\n");
	}
	else
	{
		if (note < 10)
		{
			printf("Rattrapages\n");
		}
		else
		{
			printf("Admins !\n");
		}
	}

	// Note avec switch
	int noteAsInt = note;
	switch (noteAsInt) // On ne peut pas faire de switch sur un double, il faut le faire sur un int
	{
		case 0:
		case 1:
		case 2:
		case 3:
		case 4:
		case 5:
		case 6:
		case 7:
			printf("Recalé\n");
			break;
				   
		case 8:
		case 9:
			printf("Rattrapages!\n");
			break;
			
		default:
			printf("Admis !\n");
			break;
	}
	
	return 0;
}
























