//
//  Category.h
//  ORM
//
//  Created by Nicolas VERINAUD on 14/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Category : NSObject

@property (nonatomic, strong) NSArray *articles;

+ (Category *)findById:(NSString *)identifier;

@end
