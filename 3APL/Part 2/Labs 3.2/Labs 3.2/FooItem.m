//
//  FooItem.m
//  Labs 3.2
//
//  Created by Nicolas VERINAUD on 03/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "FooItem.h"

@implementation FooItem

- (id)initWithTitle:(NSString *)title value:(CGFloat)value
{
	self = [super init];
	if (self)
	{
		self.title = title;
		self.value = value;
	}
	
	return self;
}


+ (instancetype)itemWithTitle:(NSString *)title value:(CGFloat)value
{
	return [[self alloc] initWithTitle:title value:value];
}

@end
