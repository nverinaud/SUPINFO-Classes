//
//  CatLike.m
//  Labs2
//
//  Created by Nicolas VERINAUD on 13/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "CatLike.h"

@implementation CatLike
@end

@implementation Lion

- (id)initWithName:(NSString *)name age:(int)age andMaxAge:(int)maxAge
{
	self = [super initWithName:name age:age andMaxAge:20];
	return self;
}


- (NSString *)cry
{
	return @"Roar";
}

@end


@implementation Cat

- (id)initWithName:(NSString *)name age:(int)age andMaxAge:(int)maxAge
{
	self = [super initWithName:name age:age andMaxAge:18];
	return self;
}


- (NSString *)cry
{
	return @"Meow";
}

@end
