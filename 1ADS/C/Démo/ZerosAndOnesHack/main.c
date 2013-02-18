
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void printZerosAndOnesOf(unsigned int var);

int main (int argc, const char * argv[])
{
	int bigint = 2147483647;
	unsigned int ubigint = bigint;
	
	printf("Value of bigint: %d\n", bigint);
	printZerosAndOnesOf(bigint);
	printf("\n");
	printf("Value of ubigint: %u\n", ubigint);
	printZerosAndOnesOf(ubigint);
	
	printf("\n\n");
	
	bigint++;
	ubigint++;
	printf("Value of bigint+1: %d\n", bigint);
	printZerosAndOnesOf(bigint);
	printf("\n");
	printf("Value of ubigint+1: %u\n", ubigint);
	printZerosAndOnesOf(ubigint);
	
	return 0;
}


void printZerosAndOnesOf(unsigned int var)
{
	size_t size = sizeof(int) * 8;
	size_t i;
	int test;
	int res;
	
	for (i = size-1; i != 0; i--)
	{
		test = (int)pow(2, i);
		res = var & test;
		printf("%c", (res == 0 ? '0' : '1'));
		if (i % 8 == 0)
			printf("-");
	}
}
