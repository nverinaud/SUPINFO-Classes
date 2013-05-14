//
//  main.m
//  DemoMemoryManagement
//
//  Created by Nicolas VERINAUD on 14/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Foo.h"

int main(int argc, const char * argv[])
{

	@autoreleasepool {
	    
	    Foo *f = [Foo newFoo];
		
		f = [[Foo alloc] init];
	}
	
    return 0;
}






















