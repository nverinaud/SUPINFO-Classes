//
//  NVAppDelegate.m
//  MyDemoAppAmazing
//
//  Created by Nicolas VERINAUD on 03/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "NVAppDelegate.h"

@interface NVAppDelegate ()

- (void)buttonPressed:(id)sender event:(UIEvent *)event;

@end



@implementation NVAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.backgroundColor = [UIColor whiteColor];
	
	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[button setTitle:@"Hello" forState:UIControlStateNormal];
	button.frame = CGRectMake(20, 40, 100, 44);
	[button addTarget:self action:@selector(buttonPressed:event:) forControlEvents:UIControlEventAllTouchEvents];
	[self.window addSubview:button];
	
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)buttonPressed:(id)sender event:(UIEvent *)event
{
	NSLog(@"Event: %@", event);
}

@end
















