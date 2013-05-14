//
//  Category.m
//  ORM
//
//  Created by Nicolas VERINAUD on 14/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "Category.h"
#import "Article.h"

@interface Category ()

@property (nonatomic, copy) NSString *identifier;

@end


@implementation Category

+ (Category *)findById:(NSString *)identifier
{
	// SQL
	return nil;
}


- (NSArray *)articles
{
	if (!_articles)
		_articles = [Article findByCategoryID:self.identifier];
	
	return _articles;
}

@end












