//
//  NSStringDynamicMethodsAdd.m
//  Labs4
//
//  Created by Nicolas VERINAUD on 14/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <objc/runtime.h>
#import "NSStringDynamicMethodsAdd.h"

NSString * _c_NSString_getFoo(id self, SEL _cmd, int num)
{
	NSMutableString *str = [NSMutableString string];
	
	for (int i = 0; i < num; i++)
		[str appendString:@"Foo"];
	
	return [NSString stringWithString:str];
}


int _i_NSString_jHashCode(NSString * self, SEL _cmd)
{
	unsigned int rv;
    unsigned long i,len;
    char *str;
    len = [self length];
    str = (char *)[self UTF8String];
    rv = 0;
    for(i = 0; i < len; i++){
        rv += str[i]*pow(31,len-i);
    }
	
    return(rv);
}


void dynamic_addMethodsTo_NSString()
{
	class_addMethod(object_getClass((id)NSString.class),
					@selector(getFoo:),
					(IMP)_c_NSString_getFoo,
					"@@:i");
	
	class_addMethod(NSString.class,
					@selector(jHashCode),
					(IMP)_i_NSString_jHashCode,
					"i@:");
}
