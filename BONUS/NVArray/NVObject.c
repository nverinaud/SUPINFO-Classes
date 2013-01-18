//
//  NVObject.c
//  NVArray
//
//  Created by Nicolas VERINAUD on 16/01/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#include <stdlib.h>
#include "NVObject.h"

const void * NVRetain(const void *o)
{
	NVObjectRef object = (NVObjectRef)o;
	object->retainCount++;
	return o;
}


void NVRelease(const void *o)
{
	NVObjectRef object = (NVObjectRef)o;
	object->retainCount--;
	if (object->retainCount <= 0)
		free(object);
}

