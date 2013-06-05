//
//  FooItem.h
//  Labs 3.2
//
//  Created by Nicolas VERINAUD on 03/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FooItem : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) CGFloat value;

- (id)initWithTitle:(NSString *)title value:(CGFloat)value;
+ (instancetype)itemWithTitle:(NSString *)title value:(CGFloat)value;

@end
