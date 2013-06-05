//
//  AppDelegate.m
//  Labs 3.2
//
//  Created by Nicolas VERINAUD on 03/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "AppDelegate.h"
#import "WelcomeTableViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
	
	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:[WelcomeTableViewController new]];
	self.window.rootViewController = navController;
	
    [self.window makeKeyAndVisible];
    return YES;
}


@end
