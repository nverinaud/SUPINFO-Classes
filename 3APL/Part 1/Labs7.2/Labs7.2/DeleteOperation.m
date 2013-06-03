//
//  DeleteOperation.m
//  Labs7.2
//
//  Created by Nicolas VERINAUD on 27/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "DeleteOperation.h"

@interface DeleteOperation ()

@property (nonatomic, copy) NSString *filename;

@end



@implementation DeleteOperation

@synthesize filename = _filename;

- (id)initWithFilename:(NSString *)filename
{
	self = [super init];
	if (self)
	{
		self.filename = filename;
	}
	
	return self;
}


- (void)main
{
	@autoreleasepool
	{
		NSFileManager *epicFileMan = [NSFileManager defaultManager];
		if ([epicFileMan fileExistsAtPath:self.filename])
		{
			NSLog(@"Removing file %@...", self.filename);
			
			NSError *error = nil;
			if (![epicFileMan removeItemAtPath:self.filename error:&error])
				NSLog(@"Error removing file %@", self.filename);
			else
				NSLog(@"File %@ has been removed.", self.filename);
		}
	}
}

@end






