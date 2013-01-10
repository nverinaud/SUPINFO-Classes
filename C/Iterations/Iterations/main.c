
#include <stdio.h>

int main(int argc, const char * argv[])
{
	int i, j;
	
	for (i = 1; i <= 10; i++)
	{
		printf("---- Table de %2d ----\n", i);
		for (j = 1; j <= 10; j++)
		{
			printf("%d x %d = %d\n", i, j, i*j);
		}
	}
	
    return 0;
}

