
#include <stdio.h>

int main(int argc, const char * argv[])
{
	// Table de multiplications
	int i, j;
	
	for (i = 1; i <= 10; i++)
	{
		printf("---- Table de %2d ----\n", i);
		for (j = 1; j <= 10; j++)
		{
			printf("%d x %d = %d\n", i, j, i*j);
		}
	}
	
	// Partie entière
	double x;
	int n = 0;
	int neg = 1;
	
	scanf("%lf", &x);
	
	neg = (x < 0) ? -1 : 1;
//	x = (x < 0) ? -x : x; // équivalent à x *= neg
	x *= neg;
	
	while (n+1 <= x)
	{
		n++;
	}
	
	x *= neg;
	n *= neg;
	
	printf("La partie entière de %f vaut %d", x, n);
	
    return 0;
}

