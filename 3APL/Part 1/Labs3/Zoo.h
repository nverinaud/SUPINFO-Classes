//
//  Zoo.h
//  Labs2
//
//  Created by Nicolas VERINAUD on 13/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entity.h"

@class ZooDirector, Animal;

@interface Zoo : NSObject <Entity>
{
@protected
	ZooDirector *_director;
	Animal *_animals[25];
}

@property (nonatomic, retain) ZooDirector *director;

- (id)initWithDirector:(ZooDirector *)director; // Designated initializer

/// Manage animals
- (void)addAnimal:(Animal *)animal;
- (Animal *)animalAtIndex:(NSUInteger)index;
- (void)removeAnimalAtIndex:(NSUInteger)index;

/// Feed animals
- (void)feedAnimals;

@end
