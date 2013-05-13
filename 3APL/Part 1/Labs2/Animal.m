//
//  Animal.m
//  Labs2
//
//  Created by Nicolas VERINAUD on 13/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "Animal.h"

@implementation Animal

- (NSString *)name
{
	return self->_name;
}

- (int)age
{
	return self->_age;
}

- (int)maxAge
{
	return self->_maxAge;
}

- (void)setName:(NSString *)value
{
	self->_name = value;
}

- (void)setAge:(int)value
{
	self->_age = value;
}

- (void)setMaxAge:(int)value
{
	self->_maxAge = value;
}

@end
