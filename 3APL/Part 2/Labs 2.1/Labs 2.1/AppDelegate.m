//
//  AppDelegate.m
//  Labs 2.1
//
//  Created by Nicolas VERINAUD on 01/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "AppDelegate.h"
#import "NumberedViewController.h"

@implementation AppDelegate

- (void)dealloc
{
	[_window release];
	[_navigationController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	srand((unsigned)time(NULL));
	
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
	NumberedViewController *numberedVC = [[NumberedViewController alloc] init];
	self.navigationController = [[[UINavigationController alloc] initWithRootViewController:numberedVC] autorelease];
	[numberedVC release];
	
	self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
	
    return YES;
}

@end
