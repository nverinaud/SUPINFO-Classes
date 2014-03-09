//
//  Bird.m
//  Labs3
//
//  Created by Nicolas VERINAUD on 14/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "Bird.h"

@implementation Bird

- (id)initWithName:(NSString *)name age:(int)age andMaxAge:(int)maxAge
{
	self = [super initWithName:name age:age andMaxAge:20];
	return self;
}


- (NSString *)cry
{
	return @"Tweet";
}


- (NSString *)fly
{
	return @"*Fluff fluff*"; // Is this a feather sound ? >.<
}

@end
