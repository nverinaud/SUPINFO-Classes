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
			
	Animal *animal = [[Animal alloc] init];
	animal.name = @"Chaton mignon"; // <=> [animal setName:@"Chaton mignon"];
	animal.age = 5; // <=> [animal setAge:5];
	
	NSLog(@"%@ Nom : %@, Age : %d", animal, animal.name, animal.age);
	   
	[pool drain];
	
    return 0;
}

