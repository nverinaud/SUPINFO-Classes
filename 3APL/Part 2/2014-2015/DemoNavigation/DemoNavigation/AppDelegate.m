//
//  AppDelegate.m
//  DemoNavigation
//
//  Created by Nicolas VERINAUD on 02/03/15.
//  Copyright (c) 2015 Nicolas VERINAUD. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
	
	NSMutableArray *viewControllers = [NSMutableArray arrayWithCapacity:5];
	
	for (int i = 1; i <= 5; i++)
	{
		[viewControllers addObject:[self createNavigationControllerWithCount:i]];
	}
	
	UITabBarController *tabBarController = [[UITabBarController alloc] init];
	
	tabBarController.tabBar.tintColor = UIColor.redColor;
	
	tabBarController.viewControllers = viewControllers;
	
	self.window.rootViewController = tabBarController;
	
	[self.window makeKeyAndVisible];
	return YES;
}

- (UINavigationController *)createNavigationControllerWithCount:(NSInteger)count
{
	ViewController *viewController = [[ViewController alloc] init];
	viewController.count = count;
	
	UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
	
	navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
	navigationController.navigationBar.tintColor = UIColor.yellowColor;
	
	navigationController.toolbar.barStyle = UIBarStyleBlackTranslucent;
	navigationController.toolbar.tintColor = UIColor.yellowColor;
	
	return navigationController;
}

@end












