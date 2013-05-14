//
//  Foo.h
//  Labs4
//
//  Created by Nicolas VERINAUD on 14/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Foo : NSObject
{
	int anInt;
	float aFloat;
	double aDouble;
	id anId;
	BOOL aBOOL;
	bool aBool;
	BOOL enabled;
	NSString *name;
}

@property (nonatomic, readonly, retain) id aStrongProp;
@property (nonatomic, assign) int anIntProp;
@property (nonatomic, getter = isEnabled, assign) BOOL enabled;
@property (nonatomic, readwrite, retain, setter = setName:) NSString *name;

+ (id)someClassMethod;
+ (void)someClassWithParam:(int)p andOtherParam:(BOOL)b;

@end
