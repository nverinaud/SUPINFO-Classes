//
//  Animal+RemainingLife.m
//  Labs3
//
//  Created by Nicolas VERINAUD on 14/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "Animal+RemainingLife.h"
#import "Dog.h"

@implementation Animal (RemainingLife)

- (NSInteger)remainingLife
{
	return self.maxAge - self.age;
}


- (BOOL)isDead
{
	if ([self isMemberOfClass:Dog.class])
		return NO;
	
	return self.age+1 > self.maxAge; // We need to blindly reimplement -[Animal isDead] logic because we lost the original implementation!
}

@end
