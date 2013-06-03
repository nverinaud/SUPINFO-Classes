//
//  DeleteOperation.h
//  Labs7.2
//
//  Created by Nicolas VERINAUD on 27/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeleteOperation : NSOperation
{
@protected
	NSString *_filename;
}

- (id)initWithFilename:(NSString *)filename;

@end
