//
//  Animal.h
//  Labs2
//
//  Created by Nicolas VERINAUD on 13/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject
{
	@protected
	NSString *	_name;
	int			_age;
	int			_maxAge;
}

- (NSString *)name;
- (int)age;
- (int)maxAge;

- (void)setName:(NSString *)value;
- (void)setAge:(int)value;
- (void)setMaxAge:(int)value;

@end
