//
//  main.c
//  ExoChap08Slide25
//
//  Created by Nicolas VERINAUD on 15/01/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
	int i, j, k; // nos compteurs
	double C[3][3]; // nos tableaux à 2 dimensions
	double A[3][3] = { {1, 2, 3}, {4, 5, 6}, {7, 8, 9} };
	double B[3][3] = { {1.1, 2.2, 3.3}, {4.4, 5.5, 6.6}, {7.7, 8.8, 9.9} };
	
	for (i = 0; i < 3; i++)
	{
		for (j = 0; j < 3; j++)
		{
			C[i][j] = 0;
			for (k = 0; k < 3; k++)
			{
				C[i][j] = C[i][j] + A[i][k] * B[k][j];
			}
		}
	}
	
	for (i = 0; i < 3; i++)
	{
		for (j = 0; j < 3; j++)
			printf("%5.3lf\t", C[i][j]);
		
		printf("\n");
	}
	
	
    return 0;
}












