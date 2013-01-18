//
//  main.c
//  NVArray
//
//  Created by Nicolas VERINAUD on 16/01/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#include <stdio.h>
#include "NVObject.h"
#include "NVArray.h"
#include "NVValues.h"

#define ARRAY_SIZE 10

int main(int argc, const char * argv[])
{
	int i;
	NVIntegerValueRef val = NULL;
	NVArrayRef array = NVArrayCreate(kNVObjectCallbacks);
	
	for (i = 0; i < ARRAY_SIZE; i++)
	{
		val = NVIntegerValueCreate(i);
		NVArrayAddObject(array, val);
		NVRelease(val);
		val = NULL;
	}
	
	for (i = 0; i < NVArrayGetCount(array); i++)
	{
		val = NVArrayGetObjectAtIndex(array, i);
		printf("%d ", NVIntegerValueGetValue(val));
	}
	printf("\nArray count: %lld", NVArrayGetCount(array));
	
	val = NVArrayRemoveObjectAtIndex(array, 3);
	printf("\nRemoved: %d\n", NVIntegerValueGetValue(val));
	
	for (i = 0; i < NVArrayGetCount(array); i++)
	{
		val = NVArrayGetObjectAtIndex(array, i);
		printf("%d ", NVIntegerValueGetValue(val));
	}
	printf("\nArray count: %lld", NVArrayGetCount(array));
	
	NVArrayRelease(array);
	
    return 0;
}

