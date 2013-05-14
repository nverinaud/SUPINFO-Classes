//
//  Article.m
//  ORM
//
//  Created by Nicolas VERINAUD on 14/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "Article.h"
#import "Category.h"

@interface Article ()

@property (nonatomic, copy) NSString *categoryID;

@end

@implementation Article


- (Category *)category
{
	if (!_category)
		_category = [Category findById:self.categoryID];
	
	return _category;
}


+ (NSArray *)findByCategoryID:(NSString *)identifier
{
	return nil;
}


- (BOOL)save:(NSError **)error
{
	// Insert or update in db
	
	if (error)
		*error = [NSError errorWithDomain:@"DB Error" code:501 userInfo:nil];
	
	return YES;
}

@end










