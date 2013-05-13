//
//  main.m
//  Labs2
//
//  Created by Nicolas VERINAUD on 13/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZooKit.h"

int main(int argc, const char * argv[])
{
	srand((unsigned)time(NULL));
	
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
			
	Zoo *zoo = [[Zoo alloc] init];
	zoo.director = [[ZooDirector alloc] initWithFirstname:@"Indiana" andLastname:@"Johns"];
	
	[zoo addAnimal:[[Dog alloc] initWithName:@"Pluto" andAge:5]];
	[zoo addAnimal:[[Donkey alloc] initWithName:@"Donkey Kong" andAge:10]];
	[zoo addAnimal:[[Cow alloc] initWithName:@"Milka" andAge:2]];
	[zoo addAnimal:[[Monkey alloc] initWithName:@"Diddy Kong" andAge:7]];
	[zoo addAnimal:[[Cat alloc] initWithName:@"Garfield" andAge:3]];
	[zoo addAnimal:[[Lion alloc] initWithName:@"Simba" andAge:6]];
	
	NSLog(@"== Feed animals... ==");
	[zoo feedAnimals];
	
	NSLog(@"== Description Zoo... ==");
	NSLog(@"%@", zoo);
	
	while ([zoo getOlder]);
	NSLog(@"Ze director has quit the zoo at seniority: %d", [zoo.director seniority]);
	
	[pool drain];
	
    return 0;
}

