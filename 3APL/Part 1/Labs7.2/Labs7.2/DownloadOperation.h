//
//  DownloadOperation.h
//  Labs7.2
//
//  Created by Nicolas VERINAUD on 25/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DownloadOperation : NSOperation
{
@protected
	NSURL *_url;
	NSString *_outputFilename;
	
@private
	NSData *_data;
}


- (id)initWithURL:(NSURL *)url;

- (NSString *)outputFilename;

@end
