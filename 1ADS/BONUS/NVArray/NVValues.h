//
//  NVValues.h
//  NVArray
//
//  Created by Nicolas VERINAUD on 17/01/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#ifndef NVArray_NVValues_h
#define NVArray_NVValues_h

typedef struct NVIntegerValue *NVIntegerValueRef;

NVIntegerValueRef NVIntegerValueCreate(int value);
int NVIntegerValueGetValue(NVIntegerValueRef integerValue);
void NVIntegerValueSetValue(NVIntegerValueRef integerValue, int value);

#endif
