
#include <stdio.h>

void permutationCirculaire (double *x, double *y, double *z)
{
	double w = *z;
	*z = *y;
	*y = *x;
	*x = w;
}

int main(int argc, const char * argv[])
{
	double x = 4;
	double y = 12;
	double z = 20;
	
	permutationCirculaire(&x, &y, &z);
	
	printf("x = %lf \t y = %lf \t z = %lf", x, y, z);
	
	return 0;
}

