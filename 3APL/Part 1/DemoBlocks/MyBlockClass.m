//
//  MyBlockClass.m
//  DemoBlocks
//
//  Created by Nicolas VERINAUD on 03/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "MyBlockClass.h"

typedef void(^CompletionHandler)(void);

@interface MyBlockClass ()

@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) CompletionHandler handler;

@end


@implementation MyBlockClass

- (void)dealloc
{
	NSLog(@"I am freeeeee !");
	[_callback release];
	[_state release];
	[_handler release];
	[super dealloc];
}


- (id)init
{
	self = [super init];
	if (self)
	{
		self.state = @"Created";
		
		__block MyBlockClass *weakSelf = self;
		self.handler = ^{
			weakSelf.state = @"Finished";
			/* 
			 Le block retient les objets qu'il référence par défaut
			 Pour éviter un retain cycle il faut éviter de capturer self
			 dans le block ici car self retient ce block (dans la propriété handler).
			 Pour cela on crée une variable weakSelf avec le prefixe __block pour éviter
			 que le block ne retienne cette variable.
			 */
		};
	}
	
	return self;
}


- (void)start
{
	if (_callback)
	{
		_callback(@"Hello World");
	}
	
	if (_handler)
		self.handler();
}

@end












