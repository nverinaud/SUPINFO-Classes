//
//  Animal.h
//  Labs2
//
//  Created by Nicolas VERINAUD on 13/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject
{
@protected
	NSString *_name;
	int _age;
	int _maxAge;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int age;
@property (nonatomic, readonly) int maxAge;

- (id)initWithName:(NSString *)name age:(int)age andMaxAge:(int)maxAge; // Designated initializer
- (id)initWithName:(NSString *)name andAge:(int)age;

- (NSString *)cry;
- (BOOL)isDead;
- (BOOL)getOlder;

@end























