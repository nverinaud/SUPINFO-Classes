//
//  ZooDirector.m
//  Labs2
//
//  Created by Nicolas VERINAUD on 13/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <math.h>
#import "ZooDirector.h"

@implementation ZooDirector

@synthesize firstname = _firstname;
@synthesize lastname = _lastname;

- (id)initWithFirstname:(NSString *)firstname andLastname:(NSString *)lastname
{
	self = [super init];
	if (self)
	{
		self.firstname = firstname;
		self.lastname = lastname;
	}
	
	return self;
}


- (id)init
{
	return [self initWithFirstname:@"John" andLastname:@"Doe"];
}


- (BOOL)getOlder
{
	_seniority++;
	return (!(rand() < ((double)_seniority/100.0) * ((double)RAND_MAX + 1.0)));
}


- (NSString *)description
{
	return [NSString stringWithFormat:@"The director, %@ %@ has been here for %d years.", self.firstname, self.lastname, self.seniority];
}

@end












