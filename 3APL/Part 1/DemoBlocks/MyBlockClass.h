//
//  MyBlockClass.h
//  DemoBlocks
//
//  Created by Nicolas VERINAUD on 03/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^MyBlockType)(id o);


@interface MyBlockClass : NSObject

@property (nonatomic, copy) MyBlockType callback;
- (void)setCallback:(MyBlockType)callback;

- (void)start;

@end
