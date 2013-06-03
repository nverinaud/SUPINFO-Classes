//
//  main.m
//  DemoBlocks
//
//  Created by Nicolas VERINAUD on 03/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyBlockClass.h"

int main(int argc, const char * argv[])
{

	@autoreleasepool
	{
	    
	    MyBlockClass *myBlock = nil;
		
		if (YES)
		{
			myBlock = [[MyBlockClass alloc] init];
			
			[myBlock setCallback:^(id o) {
				NSLog(@"%@", o);
			}];
			
			[myBlock start];
			[myBlock release];
		}
		
		
	}
	
    return 0;
}





















