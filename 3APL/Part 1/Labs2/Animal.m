//
//  Animal.m
//  Labs2
//
//  Created by Nicolas VERINAUD on 13/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "Animal.h"

@implementation Animal

@synthesize name = _name;
@synthesize age = _age;
@synthesize maxAge = _maxAge;


- (id)initWithName:(NSString *)name age:(int)age andMaxAge:(int)maxAge
{
	self = [super init];
	if (self)
	{
		self.name = name;
		self.age = age;
		_maxAge = maxAge;
	}
	
	return self;
}


- (id)initWithName:(NSString *)name andAge:(int)age
{
	return [self initWithName:name age:age andMaxAge:10];
}


- (id)init
{
	return [self initWithName:@"No name" age:0 andMaxAge:10];
}


- (NSString *)cry
{
	return @"I have no sound.";
}


- (BOOL)isDead
{
	return (self.age+1 > self.maxAge);
}


- (BOOL)getOlder
{
	if (![self isDead])
		self.age++;
	
	return ![self isDead];
}


- (NSString *)description
{
	NSString *description = nil;
	
	if ([self isDead])
		description = [NSString stringWithFormat:@"%@ just got %d. %@ is dead.", self.name, self.age, self.name];
	else
		description = [NSString stringWithFormat:@"%@ is %d years old.", self.name, self.age];
	
	return description;
}

@end




















