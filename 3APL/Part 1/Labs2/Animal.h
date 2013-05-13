//
//  Animal.h
//  Labs2
//
//  Created by Nicolas VERINAUD on 13/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int age;
@property (nonatomic, readonly) int maxAge;

@end
