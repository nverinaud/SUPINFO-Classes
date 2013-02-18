//
//  main.c
//  Lab49
//
//  Created by Nicolas Verinaud on 15/11/11.
//

#include <stdio.h>

int main (int argc, const char * argv[])
{
	// Énoncé
	
	/*
	 
	 int A = 1;
	 int B = 2;
	 int C = 3;
	 int *P1, *P2;
	 P1 = &A;
	 P2 = &C;
	 *P1 = (*P2)++;
	 P1 = P2;
	 P2 = &B;
	 *P1 -= *P2;
	 ++*P2;
	 *P1 *= *P2;
	 A = ++*P2 * *P1;
	 P1 = &A;
	 *P2 = *P1 /= *P2;
	 
	 */
	
	// Réponses
	
	/*
	 
	 initialisation			A		B		C		P1		P2
	 
	 P1=&A					1		2		3		&A		/
	 
	 P2=&C					1		2		3		&A		&C
	 
	 *P1=(*P2)++			3		2		4		&A		&C
	 
	 P1=P2					3		2		4		&C		&C
	 
	 P2=&B					3		2		4		&C		&B
	 
	 *P1-=*P2				3		2		2		&C		&B
	 
	 ++*P2					3		3		2		&C		&B
	 
	 *P1*=*P2				3		3		6		&C		&B
	 
	 A=++*P2**P1			24		4		6		&C		&B
	 
	 P1=&A					24		4		6		&A		&B
	 
	 *P2=*P1/=*P2			6		6		6		&A		&B
	 
	 */
	
	int A = 1;
	int B = 2;
	int C = 3;
	int *P1, *P2;
	
	printf("&A:%X \t &B:%X \t &C:%X", &A, &B, &C);
	
	printf("\nA:%d \t B:%d \t C:%d \t P1:%X \t P2:%X", A, B, C, P1, P2);
	
	P1 = &A;
	
	printf("\nA:%d \t B:%d \t C:%d \t P1:%X \t P2:%X", A, B, C, P1, P2);
	
	P2 = &C;
	
	printf("\nA:%d \t B:%d \t C:%d \t P1:%X \t P2:%X", A, B, C, P1, P2);
	
	*P1 = (*P2)++;
	
	printf("\nA:%d \t B:%d \t C:%d \t P1:%X \t P2:%X", A, B, C, P1, P2);
	
	P1 = P2;
	
	printf("\nA:%d \t B:%d \t C:%d \t P1:%X \t P2:%X", A, B, C, P1, P2);
	
	P2 = &B;
	
	printf("\nA:%d \t B:%d \t C:%d \t P1:%X \t P2:%X", A, B, C, P1, P2);
	
	*P1 -= *P2;
	
	printf("\nA:%d \t B:%d \t C:%d \t P1:%X \t P2:%X", A, B, C, P1, P2);
	
	++*P2;
	
	printf("\nA:%d \t B:%d \t C:%d \t P1:%X \t P2:%X", A, B, C, P1, P2);
	
	*P1 *= *P2;
	
	printf("\nA:%d \t B:%d \t C:%d \t P1:%X \t P2:%X", A, B, C, P1, P2);
	
	A = ++*P2 * *P1;
	
	printf("\nA:%d \t B:%d \t C:%d \t P1:%X \t P2:%X", A, B, C, P1, P2);
	
	P1 = &A;
	
	printf("\nA:%d \t B:%d \t C:%d \t P1:%X \t P2:%X", A, B, C, P1, P2);
	
	*P2 = *P1 /= *P2;
	
	printf("\nA:%d \t B:%d \t C:%d \t P1:%X \t P2:%X", A, B, C, P1, P2);
	
	printf("\n");
    return 0;
}

