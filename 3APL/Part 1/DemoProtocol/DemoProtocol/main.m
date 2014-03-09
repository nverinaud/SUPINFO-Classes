//
//  main.m
//  DemoProtocol
//
//  Created by Nicolas VERINAUD on 13/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPClient.h"

int main(int argc, const char * argv[])
{

	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	id<NetworkProtocol> networkClient = [[HTTPClient alloc] init];
	
	if ([networkClient canHandleURL:@"http://google.com"])
	{
		if ([networkClient respondsToSelector:@selector(requestURL:)])
		{
			[networkClient requestURL:@"http://google.com"];
		}
	}
	
	[pool drain];
    return 0;
}

