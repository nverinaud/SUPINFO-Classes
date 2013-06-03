//
//  main.m
//  Labs7.3
//
//  Created by Nicolas VERINAUD on 27/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <Foundation/Foundation.h>

void fill_array_with_thousand_values_seq(void);
void fill_array_with_thousand_values_dispatch_apply(void);
void load_urls_seq(NSArray *urls);
void load_urls_dispatch_apply(NSArray *urls);

int main(int argc, const char * argv[])
{
	@autoreleasepool
	{
		/* Random values */
		srand((unsigned)time(NULL));
		
		NSDate *start = [NSDate date];;
		fill_array_with_thousand_values_seq();
		NSLog(@"Seq time needed: %f seconds.", -[start timeIntervalSinceNow]);
		
		start = [NSDate date];
		fill_array_with_thousand_values_dispatch_apply();
		NSLog(@"Dispatch apply time needed: %f seconds.", -[start timeIntervalSinceNow]);
		// No gain with dispatch_apply for such simple operations
		// With 8 more operations per loop you can have a little gain using dispatch_apply
		
		// It's essential to measure to find out if such optimizations are appropriate. In this case this kind of operation won't benefit from parallelization, and the added overhead won't be compensated. The compiler can do a better job by unrolling the loop than parallelization.
		
		/* URL Loading */
		NSArray *urls = [NSArray arrayWithObjects:
							[NSURL URLWithString:@"http://www.nimbul.ru/images/nature/Gusenica1.jpg"],
							[NSURL URLWithString:@"http://www.nimbul.ru/images/nature/Gusenica2.jpg"],
							[NSURL URLWithString:@"http://www.nimbul.ru/images/nature/bee1.jpg"],
							[NSURL URLWithString:@"http://www.nimbul.ru/images/nature/bee2.jpg"],
							[NSURL URLWithString:@"http://www.nimbul.ru/images/nature/bee3.jpg"],
							[NSURL URLWithString:@"http://www.nimbul.ru/images/nature/bee4.jpg"],
							[NSURL URLWithString:@"http://www.nimbul.ru/images/nature/bird1.jpg"],
							[NSURL URLWithString:@"http://www.nimbul.ru/images/nature/bugs1.jpg"],
							[NSURL URLWithString:@"http://www.nimbul.ru/images/nature/bugs2.jpg"],
							[NSURL URLWithString:@"http://www.nimbul.ru/images/nature/bugs3.jpg"], nil];
		
		start = [NSDate date];
		load_urls_seq(urls);
		NSLog(@"Seq load urls time needed: %f seconds.", -[start timeIntervalSinceNow]);
		
		start = [NSDate date];
		load_urls_dispatch_apply(urls);
		NSLog(@"Dispatch apply load urls time needed: %f seconds.", -[start timeIntervalSinceNow]);
	}
	
    return 0;
}


void fill_array_with_thousand_values_seq()
{
	int *array = calloc(1000, sizeof(int));
	
	for (int i = 0; i < 1000; i++)
	{
		array[i] = rand();
		// Striding stuff below
		array[i] = rand();
		array[i] = rand();
		array[i] = rand();
		array[i] = rand();
		array[i] = rand();
		array[i] = rand();
		array[i] = rand();
		array[i] = rand();
	}
	
	free(array);
}


void fill_array_with_thousand_values_dispatch_apply()
{
	int *array = calloc(1000, sizeof(int));
	
	dispatch_apply(1000, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(size_t i) {
		array[i] = rand();
		// Striding stuff below
		array[i] = rand();
		array[i] = rand();
		array[i] = rand();
		array[i] = rand();
		array[i] = rand();
		array[i] = rand();
		array[i] = rand();
	});
	
	free(array);
}


void load_urls_seq(NSArray *urls)
{
	NSData **data = calloc(urls.count, sizeof(NSData*));
	
	for (int i = 0; i < urls.count; i++)
	{
		data[i] = [NSData dataWithContentsOfURL:[urls objectAtIndex:i]];
	}
	
	free(data);
}


void load_urls_dispatch_apply(NSArray *urls)
{
	NSData **data = calloc(urls.count, sizeof(NSData*));
	
	dispatch_apply(urls.count, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(size_t i) {
		data[i] = [NSData dataWithContentsOfURL:[urls objectAtIndex:i]];
	});
	
	free(data);
}

