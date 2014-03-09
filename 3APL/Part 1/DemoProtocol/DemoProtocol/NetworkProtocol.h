//
//  NetworkProtocol.h
//  DemoProtocol
//
//  Created by Nicolas VERINAUD on 13/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NetworkProtocol <NSObject>

@required
- (BOOL)canHandleURL:(NSString *)url;

@optional
- (void)requestURL:(NSString *)url;

@end
