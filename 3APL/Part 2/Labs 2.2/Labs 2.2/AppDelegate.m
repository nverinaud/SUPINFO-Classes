//
//  AppDelegate.m
//  Labs 2.2
//
//  Created by Nicolas VERINAUD on 01/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "AppDelegate.h"
#import "CustomViewController.h"

#define NUMBER_OF_VCs 11

@implementation AppDelegate

- (void)dealloc
{
	[_window release];
    [super dealloc];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];

	UITabBarController *tabBarController = [[UITabBarController alloc] init];
	
	NSMutableArray *viewControllers = [[NSMutableArray alloc] initWithCapacity:NUMBER_OF_VCs];
	CustomViewController *customVC = nil;
	UITabBarItem *item = nil;
	NSString *caption = nil;
	
	for (NSInteger i = 1; i <= NUMBER_OF_VCs; i++)
	{
		item = [[UITabBarItem alloc] initWithTabBarSystemItem:i tag:i];
		if (i%3 == 0)
			item.badgeValue = [NSString stringWithFormat:@"%d", i];
		caption = [NSString stringWithFormat:NSLocalizedString(@"Caption %d", nil), i+1];
		customVC = [[CustomViewController alloc] initWithCaption:caption andItem:item];
		
		[viewControllers addObject:customVC];
		
		[customVC release];
		[caption release];
		[item release];
	}
	
	tabBarController.viewControllers = [NSArray arrayWithArray:viewControllers];
	[viewControllers release];
	
	self.window.rootViewController = tabBarController;
	[tabBarController release];
	
    [self.window makeKeyAndVisible];
	
    return YES;
}

@end
