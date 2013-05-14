//
//  ZooDirector.m
//  Labs2
//
//  Created by Nicolas VERINAUD on 13/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <math.h>
#import "ZooDirector.h"

@interface ZooDirector ()

@property (nonatomic, readwrite) int seniority;
@property (nonatomic, assign) int salary;

@end


@implementation ZooDirector

@synthesize firstname = _firstname;
@synthesize lastname = _lastname;
@synthesize seniority = _seniority;
@synthesize salary = _salary;

- (id)initWithFirstname:(NSString *)firstname andLastname:(NSString *)lastname
{
	self = [super init];
	if (self)
	{
		self.firstname = firstname;
		self.lastname = lastname;
		self.salary = 2000;
	}
	
	return self;
}


- (id)init
{
	return [self initWithFirstname:@"John" andLastname:@"Doe"];
}


- (BOOL)getOlder // returns YES if the director stay
{
	self.seniority++;
	return !(rand()%101 < _seniority);
}


- (NSString *)description
{
	return [NSString stringWithFormat:@"The director, %@ %@ has been here for %d years.", self.firstname, self.lastname, self.seniority];
}

@end












