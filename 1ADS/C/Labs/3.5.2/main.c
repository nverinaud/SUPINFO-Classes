//
//  main.c
//  Lab50
//
//  Created by Nicolas Verinaud on 15/11/11.
//

#include <stdio.h>

int main (int argc, const char * argv[])
{
	// Énoncé
	int A[] = {12, 23, 34, 45, 56, 78, 89, 90};	
	int *P;
	P = A;
	
	// Réponses
	
	/*
	 
	 1. *P+2				-> 14
	 2. *(P+2)				-> 34
	 3. &A[4]-1				-> &45
	 4. A+3					-> &45
	 5. &A[7]-P				-> ?? &90 - &12
	 6. P+(*P-10)			-> &12
	 7. *(P+*(P+8)-A[7])	-> CRASH
	 
	 */
	
	// Correction
	printf("%d\n", *P+2);
	printf("%d\n", *(P+2));
	printf("%x\n", &A[4]-1);
	printf("%x\n", A+3);
	printf("%x\n", &A[7]-P);
	printf("%x\n", P+(*P-10));
	printf("%d\n", *(P+*(P+8)-A[7]));
	
	printf("\n");
    return 0;
}

