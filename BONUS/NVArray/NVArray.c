//
//  NVArray.c
//  NVArray
//
//  Created by Nicolas VERINAUD on 16/01/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include "NVObject.h"
#include "NVArray.h"

#define MEMORY_BATCH_CAPACITY 2

NVArrayCallbacks kNVObjectCallbacks = {
	NVRetain,
	NVRelease
};

#pragma mark -
#pragma mark - NVArray

struct NVArray
{
	unsigned int retainCount;
	NVIndex size;
	NVIndex allocatedMemorySize;
	void **items;
	NVArrayCallbacks callbacks;
};


#pragma mark - Creation & destruction

NVArrayRef
NVArrayCreate(NVArrayCallbacks callbacks)
{
	NVArrayRef array = malloc(sizeof(struct NVArray));
	array->retainCount = 1;
	array->size = 0;
	array->callbacks = callbacks;
	array->allocatedMemorySize = MEMORY_BATCH_CAPACITY;
	array->items = calloc(array->allocatedMemorySize, sizeof(void*));
	return array;
}


void
NVArrayRelease(NVArrayRef array)
{
	if (array->retainCount == 1)
	{
		NVIndex size = array->size;
		NVIndex i;
		void *item = NULL;
		
		for (i = 0; i < size; i++)
		{
			item = NVArrayGetObjectAtIndex(array, i);
			array->callbacks.release(item);
		}
		
		free(array->items);
	}
	
	NVRelease(array);
}


#pragma mark - Query

NVIndex
NVArrayGetCount(NVArrayRef array)
{
	return array->size;
}


void *
NVArrayGetObjectAtIndex(NVArrayRef array, NVIndex index)
{
	return array->items[index];
}


#pragma mark - Update

void
NVArrayAddObject(NVArrayRef array, void *value)
{
	NVIndex size = array->size;
	NVIndex allocated = array->allocatedMemorySize;
	
	if (size + 1 > allocated)
	{
		array->allocatedMemorySize += MEMORY_BATCH_CAPACITY;
		array->items = realloc(array->items, array->allocatedMemorySize * sizeof(void*));
	}
	
	array->items[size] = (void*)array->callbacks.retain(value);
	array->size++;
}


void *
NVArrayRemoveObjectAtIndex(NVArrayRef array, NVIndex index)
{
	NVIndex i = index;
	void *object = NVArrayGetObjectAtIndex(array, index);
	
	while (i < array->size-1)
	{
		array->items[i] = array->items[i+1];
		i++;
	}
	
	array->items[i] = NULL;
	array->size--;
	
	array->callbacks.release(object);
	return object;
}

