//
//  main.m
//  Labs2
//
//  Created by Nicolas VERINAUD on 13/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Animal.h"

int main(int argc, const char * argv[])
{

	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	    
	// My code		
	Animal *animal;
	animal = [[Animal alloc] init];
	[animal setName:@"Chaton mignon"];
	[animal setAge:5];
	[animal setMaxAge:20];
	
	NSLog(@"%@ Nom : %@, Age : %d", animal, [animal name], [animal age]);
	   
	[pool drain];
	
    return 0;
}

