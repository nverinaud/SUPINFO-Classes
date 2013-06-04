//
//  AppDelegate.m
//  DemoNavigation
//
//  Created by Nicolas VERINAUD on 04/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "AppDelegate.h"
#import "MyCustomViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
	
	MyCustomViewController *customVC = [[MyCustomViewController alloc] init];
	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:customVC];
	self.window.rootViewController = navController;
	
    [self.window makeKeyAndVisible];
    return YES;
}

@end
