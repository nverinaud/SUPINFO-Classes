//
//  AppDelegate.m
//  DemoXIB
//
//  Created by Nicolas VERINAUD on 03/03/15.
//  Copyright (c) 2015 Nicolas VERINAUD. All rights reserved.
//

#import "AppDelegate.h"
#import "MyTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
	
	self.window.rootViewController = [[MyTableViewController alloc] init];
	
	[self.window makeKeyAndVisible];
	return YES;
}

@end
