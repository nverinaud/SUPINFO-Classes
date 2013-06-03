//
//  DownloadOperation.m
//  Labs7.2
//
//  Created by Nicolas VERINAUD on 25/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "DownloadOperation.h"

@interface DownloadOperation ()

@property (nonatomic, strong) NSURL *url;
@property (nonatomic, copy) NSString *outputFilename;
@property (nonatomic, strong) NSData *data;

@end



@implementation DownloadOperation

@synthesize url = _url;
@synthesize outputFilename = _outputFilename;
@synthesize data = _data;

- (void)dealloc
{
	[_url release];
	[_outputFilename release];
	[_data release];
	
	[super dealloc];
}


- (id)initWithURL:(NSURL *)url
{
	self = [super init];
	if (self)
	{
		self.url = url;
		self.outputFilename = [self.url lastPathComponent];
	}
	
	return self;
}


- (void)main
{
	@autoreleasepool
	{
		NSLog(@"Start downloading %@...", self.url);
		self.data = [NSData dataWithContentsOfURL:self.url];
		
		if (self.data)
			[self.data writeToFile:self.outputFilename atomically:YES];
		
		NSLog(@"Finish downloading %@ to file %@.", self.url, self.outputFilename);
	}
}

@end















