//
//  main.m
//  Labs3
//
//  Created by Nicolas VERINAUD on 14/05/13.
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
	[zoo addAnimal:[[Bird alloc] initWithName:@"Titi" andAge:5]];
	[zoo addAnimal:[[Parrot alloc] initWithName:@"Coco" andAge:7]];
	
	NSLog(@"== Feeding animals... ==");
	[zoo feedAnimals];
	
	Animal *randomAnimal = [zoo animalAtIndex:3];
	NSInteger remainingLife = [randomAnimal remainingLife];
	NSLog(@"Remaining life of %@: %ld", randomAnimal.name, remainingLife);
	// Make this animal older since he should die.
	for (int i = 0; i <= remainingLife; i++)
	{
		[randomAnimal getOlder];
	}
	
	// Did he died ?
	NSLog(@"Is %@ dead ? %d (remainingLife: %ld)", randomAnimal.name, [randomAnimal isDead], [randomAnimal remainingLife]);
	
	// Class extension stuff
//	zoo.director.seniority = 20; // Compilation error
	[zoo.director setSeniority:20]; // Compilation warning but it works !
	NSLog(@"Director seniority: %d", zoo.director.seniority);
//	zoo.director.salary = 3000; // Compilation error
//	zoo.director->_salary = 3000; // Compilation error
	id director = zoo.director;
	[director setSalary:3000]; // Compilation warning but it works ! I've hack this class youhou!
	NSLog(@"Director salary: %d", (int)[director salary]); // Compilation warning
	
	// Dummy check
	NSLog(@"== Dummy check... ==");
	id dummy = [zoo animalAtIndex:1];
	NSLog(@"<Animal> Dummy cry: %@", [dummy cry]);
	dummy = zoo.director;
	
	@try
	{
		NSLog(@"<ZooDirector> Dummy cry: %@", [dummy cry]);
	}
	@catch (NSException *exception)
	{
		NSLog(@"Oops, something bad happened: %@", [exception reason]);
		
		@try
		{
			[zoo animalAtIndex:632];
		}
		@catch (NSException *exception)
		{
			NSLog(@"Exception: %@", [exception reason]);
		}
		
		@throw;
	}
	
	[pool drain];
	
	NSLog(@"End of the program.");
    return 0;
}

