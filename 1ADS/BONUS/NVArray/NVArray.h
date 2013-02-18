//
//  NVArray.h
//  NVArray
//
//  Created by Nicolas VERINAUD on 16/01/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#ifndef NVArray_NVArray_h
#define NVArray_NVArray_h

typedef const void * (*NVArrayRetainCallback)(const void *);
typedef void (*NVArrayReleaseCallback)(const void *);

typedef struct {
	NVArrayRetainCallback retain;
	NVArrayReleaseCallback release;
} NVArrayCallbacks;

extern NVArrayCallbacks kNVObjectCallbacks;

typedef struct NVArray *NVArrayRef;

NVArrayRef
NVArrayCreate(NVArrayCallbacks);

void
NVArrayRelease(NVArrayRef);

NVIndex
NVArrayGetCount(NVArrayRef);

void *
NVArrayGetObjectAtIndex(NVArrayRef, NVIndex);

void
NVArrayAddObject(NVArrayRef, void *);

void *
NVArrayRemoveObjectAtIndex(NVArrayRef, NVIndex);

#endif
