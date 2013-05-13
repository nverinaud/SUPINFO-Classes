//
//  Donkey.m
//  Labs2
//
//  Created by Nicolas VERINAUD on 13/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "Donkey.h"

@implementation Donkey

- (id)initWithName:(NSString *)name age:(int)age andMaxAge:(int)maxAge
{
	self = [super initWithName:name age:age andMaxAge:15];
	return self;
}


- (NSString *)cry
{
	return @"Hee-Haw";
}

@end
