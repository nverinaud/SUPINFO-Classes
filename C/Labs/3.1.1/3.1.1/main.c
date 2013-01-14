//
//  main.c
//  3.1.1
//
//  Created by Nicolas VERINAUD on 14/01/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
	int x;
	int y;
	int z;
	
	printf("Saisir 3 entiers\n");
	scanf("%d%d%d",&x,&y,&z);
	if (x<=y && y<=z)
		printf("Ces 3 nombres sont dans l'ordre croissant");
	else
		printf("Ces 3 nombres ne sont pas dans l'ordre croissant");
	
	return 0;
}

