//
//  main.m
//  Labs7.2
//
//  Created by Nicolas VERINAUD on 25/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DownloadOperation.h"
#import "ConversionOperation.h"
#import "DeleteOperation.h"

int main(int argc, const char * argv[])
{

	@autoreleasepool
	{
		NSArray *urls = [NSArray arrayWithObjects:
							[NSURL URLWithString:@"http://www.australia.com/contentimages/about-landscapes-nature.jpg"],
							[NSURL URLWithString:@"http://www.australia.com/contentimages/explore-things-to-see-do-nature.jpg"],
							[NSURL URLWithString:@"http://wallpapershdspot.com/wp-content/uploads/2013/05/nature-hd-wallpapers-91231-f.jpg"],
							[NSURL URLWithString:@"http://www.desicomments.com/wallpapers/force_of_nature/force_of_nature_33.jpg"],
							[NSURL URLWithString:@"http://wallpaperspoints.com/wp-content/uploads/2013/04/3d-nature-wallpaper-design.jpg"], nil];
		
		NSOperationQueue *queue = [[NSOperationQueue alloc] init];
		queue.name = @"Download & convert queue";
		__block DownloadOperation *dlOperation = nil;
		__block ConversionOperation *convertOperation = nil;
		__block DeleteOperation *deleteOperation = nil;
		
		NSLog(@"Starting downloading and converting %ld images.", (unsigned long)urls.count);
				
		[urls enumerateObjectsUsingBlock:^(NSURL *url, NSUInteger idx, BOOL *stop) {
			
			dlOperation = [[DownloadOperation alloc] initWithURL:url];
			convertOperation = [[ConversionOperation alloc] initWithFile:[dlOperation outputFilename]];
			deleteOperation = [[DeleteOperation alloc] initWithFilename:[dlOperation outputFilename]];
			
			[convertOperation addDependency:dlOperation];
			[deleteOperation addDependency:convertOperation];
			
			[queue addOperation:dlOperation];
			[queue addOperation:convertOperation];
			[queue addOperation:deleteOperation];
			
			// They are retained by the queue now
			[dlOperation release];
			[convertOperation release];
			[deleteOperation release];
			
		}];
		
		[queue waitUntilAllOperationsAreFinished];
		[queue release];
		
		NSLog(@"Download & convert are done !");
	}
	
    return 0;
}

