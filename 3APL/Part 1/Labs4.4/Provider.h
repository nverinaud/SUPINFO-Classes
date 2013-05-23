//
//  Provider.h
//  Labs4.4
//
//  Created by Nicolas Verinaud on 21/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Provider : NSObject
{
	char *_quotesDb[5];
}

- (const char *)randomQuote;

@end
