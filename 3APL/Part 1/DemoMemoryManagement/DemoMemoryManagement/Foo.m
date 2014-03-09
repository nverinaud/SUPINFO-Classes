//
//  Foo.m
//  DemoMemoryManagement
//
//  Created by Nicolas VERINAUD on 14/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "Foo.h"

@implementation Foo

@synthesize name = _name;
@synthesize info = _info;
@synthesize bar = _bar;
@synthesize dict = _dict;
@synthesize url = _url;


+ (Foo *)newFoo
{
	return [Foo new];
}


+ (Foo *)foo
{
	return [[Foo alloc] init];
}


- (void)setName:(NSString *)name
{
	_name = name;
}


- (void)setDict:(NSDictionary *)dict
{
	_dict = dict;
}

@end














