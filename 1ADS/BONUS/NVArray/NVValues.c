//
//  NVValues.c
//  NVArray
//
//  Created by Nicolas VERINAUD on 17/01/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include "NVValues.h"

struct NVIntegerValue
{
	unsigned long long retainCount;
	int value;
};

NVIntegerValueRef NVIntegerValueCreate(int value)
{
	NVIntegerValueRef integerValue = malloc(sizeof(struct NVIntegerValue));
	integerValue->retainCount = 1;
	integerValue->value = value;
	return integerValue;
}


int NVIntegerValueGetValue(NVIntegerValueRef integerValue)
{
	return integerValue->value;
}


void NVIntegerValueSetValue(NVIntegerValueRef integerValue, int value)
{
	integerValue->value = value;
}
