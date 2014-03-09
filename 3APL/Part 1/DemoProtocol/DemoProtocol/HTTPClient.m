//
//  HTTPClient.m
//  DemoProtocol
//
//  Created by Nicolas VERINAUD on 13/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "HTTPClient.h"

@implementation HTTPClient

- (BOOL)canHandleURL:(NSString *)url
{
	return [url hasPrefix:@"http"] || [url hasPrefix:@"https"];
}


- (void)requestURL:(NSString *)url
{
	NSLog(@"Requesting %@ ...", url);
}

@end
