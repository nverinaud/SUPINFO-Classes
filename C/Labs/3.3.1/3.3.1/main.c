
#include <stdio.h>

int main(int argc, const char * argv[])
{
	int tableau[10];
	int i;
	for (i=0; i<10; i++)
	{
		printf("Saisir la valeur %d: ",i);
		scanf("%d", &tableau[i]);
	}
	int min,max;
	min=tableau[0];
	max=tableau[0];
	for (i=0; i<10; i++)
	{
		if (tableau[i]<min) {
			min=tableau[i];
		
		}
		
		if (tableau[i]>max){
			max=tableau[i];
		}
		
	}
	printf("La valeur minimale est %d ",min);
	printf("\n");
	printf("La valeur maximale est %d ",max);
	
    return 0;
}

