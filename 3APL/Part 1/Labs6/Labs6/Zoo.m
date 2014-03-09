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

@interface Zoo ()

@property (nonatomic, retain) NSMutableArray *animals;

@end


@implementation Zoo

@synthesize director = _director;
@synthesize animals = _animals;

#pragma mark - Memory Management

- (void)dealloc
{
	[_director release];
	[_animals release];
	
	[super dealloc];
}


#pragma mark - Creation
#pragma mark Designated initializer
- (id)initWithDirector:(ZooDirector *)director
{
	self = [super init];
	if (self)
	{
		self.director = director;
		_animals = [[NSMutableArray alloc] initWithCapacity:25];
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
	[self.animals addObject:animal];
}


- (Animal *)animalAtIndex:(NSUInteger)index
{
	return [self.animals objectAtIndex:index];
}


- (Animal *)animalWithName:(NSString *)name
{
	NSSet *animals = [NSSet setWithArray:self.animals];
	Animal *animal = [[animals objectsPassingTest:^BOOL(Animal *obj, BOOL *stop) {
		
		if ([obj.name isEqualToString:name])
		{
			*stop = YES;
			return YES;
		}
		
		return NO;
		
	}] anyObject];
	
	return animal;
}


- (void)removeAnimalWithName:(NSString *)name
{
	Animal *animal = [self animalWithName:name];
	[self.animals removeObject:animal];
}


- (void)removeAnimalAtIndex:(NSUInteger)index
{
	[self.animals removeObjectAtIndex:index];
}


#pragma mark - Feed animals

- (void)feedAnimals
{
	for (Animal *animal in self.animals)
		NSLog(@"%@: %@", animal.name, [animal cry]);
}


#pragma mark - Aging

- (BOOL)getOlder
{
	NSArray *animals = [NSArray arrayWithArray:self.animals];
	
	for (Animal *animal in animals)
	{
		[animal getOlder];
		NSLog(@"%@", animal);
		if ([animal isDead])
			[self.animals removeObject:animal];
	}
	
	return [self.director getOlder];
}


#pragma mark - Description

- (NSString *)description
{
	NSMutableString *description = [NSMutableString string];
	
	[description appendString:[self.director description]];
	
	for (Animal *animal in self.animals)
		[description appendFormat:@"\n%@", animal];
	
	return description;
}

@end


















