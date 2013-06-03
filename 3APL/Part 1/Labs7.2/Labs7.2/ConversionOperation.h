//
//  ConversionOperation.h
//  Labs7.2
//
//  Created by Nicolas VERINAUD on 25/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConversionOperation : NSOperation
{
@protected
	NSString *_filename;
	NSString *_convertedFileName;
}

- (id)initWithFile:(NSString *)filename;

- (NSString *)convertedFilename;

@end
