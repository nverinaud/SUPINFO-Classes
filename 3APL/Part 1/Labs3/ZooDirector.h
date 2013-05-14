//
//  ZooDirector.h
//  Labs2
//
//  Created by Nicolas VERINAUD on 13/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entity.h"

@interface ZooDirector : NSObject <Entity>
{
@protected
	NSString *_firstname;
	NSString *_lastname;
	int _seniority;
}

@property (nonatomic, copy) NSString *firstname;
@property (nonatomic, copy) NSString *lastname;
@property (nonatomic, readonly) int seniority;

- (id)initWithFirstname:(NSString *)firstname andLastname:(NSString *)lastname; // Designated initializer

@end
