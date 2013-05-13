//
//  Zoo.m
//  Labs2
//
//  Created by Nicolas VERINAUD on 13/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "Zoo.h"
#import "ZooDirector.h"
#import "Animal.h"

@implementation Zoo

@synthesize director = _director;

#pragma mark - Creation
#pragma mark Designated initializer
- (id)initWithDirector:(ZooDirector *)director
{
	self = [super init];
	if (self)
	{
		self.director = director;
		memset(_animals, 0, 25*sizeof(Animal*));
	}
	
	return self;
}


#pragma mark Overriden initializer
- (id)init
{
	return [self initWithDirector:nil];
}


#pragma mark - Manage animals

- (void)addAnimal:(Animal *)animal
{
	for (int i = 0; i < 25; i++)
	{
		if (_animals[i] == NULL)
		{
			_animals[i] = animal;
			return;
		}
	}
	
	NSLog(@"WARNING: no more place to adopt a new animal.");
}


- (Animal *)animalAtIndex:(NSUInteger)index
{
	return _animals[index];
}


- (void)removeAnimalAtIndex:(NSUInteger)index
{
	_animals[index] = NULL;
}


#pragma mark - Feed animals

- (void)feedAnimals
{
	Animal *animal = nil;
	for (int i = 0; i < 25; i++)
	{
		animal = [self animalAtIndex:i];
		if (animal)
			NSLog(@"%@: %@", animal.name, [animal cry]);
	}
}


#pragma mark - Aging

- (BOOL)getOlder
{
	Animal *animal = nil;
	for (int i = 0; i < 25; i++)
	{
		animal = [self animalAtIndex:i];
		if (animal)
		{
			[animal getOlder];
			NSLog(@"%@", animal);
			if ([animal isDead])
				[self removeAnimalAtIndex:i];
		}
	}
	
	return [self.director getOlder];
}


#pragma mark - Description

- (NSString *)description
{
	NSMutableString *description = [NSMutableString string];
	
	[description appendString:[self.director description]];
	
	Animal *animal = nil;
	for (int i = 0; i < 25; i++)
	{
		animal = [self animalAtIndex:i];
		if (animal)
			[description appendFormat:@"\n%@", animal];
	}
	
	return description;
}

@end


















