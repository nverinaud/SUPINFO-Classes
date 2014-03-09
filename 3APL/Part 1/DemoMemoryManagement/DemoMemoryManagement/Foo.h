//
//  Foo.h
//  DemoMemoryManagement
//
//  Created by Nicolas VERINAUD on 14/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Foo : NSObject
{
@protected
	NSString *_name;
	NSString *_info;
	int _bar;
	NSDictionary *_dict;
	NSURL *_url;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *info;
@property (nonatomic, assign) int bar;
@property (nonatomic, strong) NSDictionary *dict;
@property (nonatomic, strong) NSURL *url;

+ (Foo *)newFoo;
+ (Foo *)foo;

@end

















