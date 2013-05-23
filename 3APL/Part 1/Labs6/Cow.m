//
//  Cow.m
//  Labs2
//
//  Created by Nicolas VERINAUD on 13/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "Cow.h"

@implementation Cow

- (id)initWithName:(NSString *)name age:(int)age andMaxAge:(int)maxAge
{
	self = [super initWithName:name age:age andMaxAge:5];
	return self;
}


- (NSString *)cry
{
	return @"Moo";
}

@end
