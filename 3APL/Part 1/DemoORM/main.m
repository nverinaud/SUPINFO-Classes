//
//  main.m
//  ORM
//
//  Created by Nicolas VERINAUD on 14/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Article.h"
#import "Category.h"

int main(int argc, const char * argv[])
{

	@autoreleasepool {
		
		Article *article = [Article new];
		article.category = [Category new];
		
		NSError *error = nil;
		if ([article save:&error])
		{
			NSLog(@"Error during save of article: %@", error.localizedDescription);
		}
		
	}
    return 0;
}

