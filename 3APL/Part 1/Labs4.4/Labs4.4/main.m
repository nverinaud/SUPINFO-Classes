//
//  main.m
//  Labs4.4
//
//  Created by Nicolas Verinaud on 21/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sys/time.h>
#import "Provider.h"

int main(int argc, const char * argv[])
{

	@autoreleasepool
	{
	    srand((unsigned)time(NULL));
		
		if (argc >= 2)
		{
			unsigned long long max = strtoull(argv[1], NULL, 10);
			unsigned long long i = max;
			Provider *p = [[Provider alloc] init];
			struct timeval start;
			struct timeval end;
			time_t timeNeededMessages = 0; // in microsecs
			time_t timeNeededDirectInvocation = 0; // in microsecs
			
			// Messages
			gettimeofday(&start, NULL);
			
			while (i--)
				[p randomQuote];
			
			gettimeofday(&end, NULL);
			
			timeNeededMessages = (end.tv_sec*1000000 + end.tv_usec) - (start.tv_sec*1000000 + start.tv_usec);
			printf("Loop of %llu iterations took %ld usecs (%f secs) using messages.\n", max, timeNeededMessages, timeNeededMessages/10e5);
			
			// Direct invocation
			IMP method = [p methodForSelector:@selector(randomQuote)];
			i = max;
			
			gettimeofday(&start, NULL);
			
			while (i--)
				method(p, @selector(randomQuote));
			
			gettimeofday(&end, NULL);
			
			timeNeededDirectInvocation = (end.tv_sec*1000000 + end.tv_usec) - (start.tv_sec*1000000 + start.tv_usec);
			printf("Loop of %llu iterations took %ld usecs (%f secs) using direct invocation.\n", max, timeNeededDirectInvocation, timeNeededDirectInvocation/10e5);
			
			// Comparaison
			double delta = ((timeNeededMessages - timeNeededDirectInvocation) / (double)timeNeededMessages) * 100;
			printf("The speedup using method calls represents %.2f%%.\n", delta);
		}
	    else
		{
			printf("usage: %s number_of_print", argv[0]);
			return -1;
		}
	}
	
    return 0;
}

