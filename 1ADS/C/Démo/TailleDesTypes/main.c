//
//  main.c
//  TailleDesTypes
//
//  Created by Nicolas VERINAUD on 10/01/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
	printf("Taille des types:\n");
	
	printf("char:\t\t\t %lu\n", sizeof(char));
	printf("unsigned char:\t %lu\n", sizeof(unsigned char));
	printf("short:\t\t\t %lu\n", sizeof(short));
	printf("int:\t\t\t\t %lu\n", sizeof(int));
	printf("long:\t\t\t %lu\n", sizeof(long));
	printf("long long:\t %lu\n", sizeof(long long));
	printf("float:\t\t\t %lu\n", sizeof(float));
	printf("double:\t\t\t %lu\n", sizeof(double));
	printf("long double:\t %lu\n", sizeof(long double));
	
	printf("\nMon premier double = %4.2f, et mon deuxieme = %4.2f", 243.6, 22.3);
	
	return 0;
}













