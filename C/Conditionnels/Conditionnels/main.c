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
	double x;
	int n = 0;
	int neg = 1;
	
	scanf("%lf", &x);
	
	neg = (x < 0) ? -1 : 1;
//	x = (x < 0) ? -x : x;
	x *= neg;
	
	while (n+1 <= x)
	{
		n++;
	}
	
	x *= neg;
	n *= neg;
	
	printf("La partie entière de %f vaut %d", x, n);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	double note;
//	scanf("%lf", &note);
//	
//	if (note < 8)
//	{
//		printf("Recalé\n");
//	}
//	else
//	{
//		if (note < 10)
//		{
//			printf("Rattrapages\n");
//		}
//		else
//		{
//			printf("Admins !\n");
//		}
//	}
	
//	switch ((int)note)
//	{
//		case 0:
//		case 1:
//		case 2:
//		case 3:
//		case 4:
//		case 5:
//		case 6:
//		case 7:
//			printf("Recalé\");
//			break;
//				   
//	    case 8:
//		case 9:
//			printf("Rattrapages!\n");
//			break;
//			
//		default:
//			printf("Admis !\n");
//			break;
//	}
	
	
//	int n = 2;
//	
//	switch (n)
//	{
//		case 1:
//		{
//			printf("n vaut 1\n");
//			printf("n vaut 1 c'est sûre !\n");
//			break;
//		}
//			
//		case 2:
//			printf("n vaut 2\n");
//			break;
//			
//		case 3:
//			printf("n vaut 3\n");
//			break;
//			
//		default:
//			printf("n ne vaut ni 1 ni 2 ni 3\n");
//			break;
//	}
	
	
	
	
    return 0;
}
























