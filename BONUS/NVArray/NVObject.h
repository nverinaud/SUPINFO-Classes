//
//  NVObject.h
//  NVArray
//
//  Created by Nicolas VERINAUD on 16/01/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#ifndef NVArray_NVObject_h
#define NVArray_NVObject_h

typedef signed long long NVIndex;

struct NVObject
{
	NVIndex retainCount;
};
typedef struct NVObject *NVObjectRef;


const void * NVRetain(const void *);
void NVRelease(const void *);

#endif
