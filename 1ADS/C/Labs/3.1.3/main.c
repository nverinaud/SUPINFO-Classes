//
//  main.c
//  3.1.3
//
//  Created by Nicolas VERINAUD on 14/01/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
	int a, b;
	printf("a b aETb\t aOUb\n");
	
	for (a=0; a<= 1; a++)
	{
		for (b=0; b<=1; b++)
		{
			printf("%d %d %d\t\t %d\n", a, b, a&&b, a||b);
		}
				
	}
    
	return 0;
}

