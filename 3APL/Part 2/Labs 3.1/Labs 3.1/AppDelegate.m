//
//  AppDelegate.m
//  Labs 3.1
//
//  Created by Nicolas VERINAUD on 03/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "AppDelegate.h"
#import "SlotViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
	
	self.window.rootViewController = [[SlotViewController alloc] init];
	
    [self.window makeKeyAndVisible];
    return YES;
}

@end
