//
//  main.m
//  DemoFastEnumeration
//
//  Created by Nicolas VERINAUD on 14/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

	@autoreleasepool {
	    
		NSArray *array = @[
					  @"One",
					  @"Two",
					  @3.1,
					  @"Four",
					  @5
		];
		
		id obj1 = [array objectAtIndex:0];
		obj1 = array[0];
		
		NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
							  @"Obj1", @"Key1",
							  @"Obj2", @"Key2", nil];
		
		dict = @{
		   @"Key1" : @"Obj1",
		   @"Key2" : @"Obj2"
		};
		obj1 = [dict objectForKey:@"Key1"];
		obj1 = dict[@"Key1"];
		
		NSLog(@"== Foreach");
		for (id obj in array)
		{
			NSLog(@"%@", [obj class]);
		}
		
		
		NSLog(@"== Reversed foreach");
		for (id obj in [array reverseObjectEnumerator])
		{
			NSLog(@"%@", obj);
		}
	}
    return 0;
}









