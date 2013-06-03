//
//  Zoo.h
//  Labs2
//
//  Created by Nicolas VERINAUD on 13/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZooDirector, Animal;

@interface Zoo : NSObject
{
@protected
	ZooDirector *_director;
//	Animal *_animals[25];
	NSMutableArray *_animals;
}

@property (nonatomic, retain) ZooDirector *director;

- (id)initWithDirector:(ZooDirector *)director; // Designated initializer

/// Manage animals
- (void)addAnimal:(Animal *)animal;
- (Animal *)animalAtIndex:(NSUInteger)index;
- (Animal *)animalWithName:(NSString *)name;
- (void)removeAnimalAtIndex:(NSUInteger)index;
- (void)removeAnimalWithName:(NSString *)name;

/// Feed animals
- (void)feedAnimals;

/// Aging
- (BOOL)getOlder; // returns YES if the director stay

@end
