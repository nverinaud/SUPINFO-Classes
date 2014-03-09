//
//  main.m
//  Labs4
//
//  Created by Nicolas VERINAUD on 14/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Foo.h"
#import "Dumper.h"
#import "NSStringDynamicMethodsAdd.h"

int main(int argc, const char * argv[])
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	dump_class("Foo");
//	dump_class("NSURL");
//	dump_class("NSObject");
//	dump_class("Unknown");
	
	dynamic_addMethodsTo_NSString();
	
	int n = 0;
	printf("How many foos ? ");
	scanf("%d", &n);
	
	id obj = [NSString class];
	NSString *fooString = [obj performSelector:@selector(getFoo:) withObject:(id)n];
	printf("%s", [fooString UTF8String]);
	printf(" Hash code: %d", (int)[fooString jHashCode]);
	
	[pool drain];
    return 0;
}

