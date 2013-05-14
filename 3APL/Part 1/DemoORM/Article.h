//
//  Article.h
//  ORM
//
//  Created by Nicolas VERINAUD on 14/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Category;

@interface Article : NSObject

@property (nonatomic, strong) Category *category;

+ (NSArray *)findByCategoryID:(NSString *)identifier;

- (BOOL)save:(NSError **)error;

@end
