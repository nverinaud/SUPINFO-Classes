//
//  AppDelegate.m
//  Labs 5.1
//
//  Created by Nicolas VERINAUD on 05/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "AppDelegate.h"

#import "EtchASketchViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	self.viewController = [EtchASketchViewController new];
	self.window.rootViewController = self.viewController;
	
    [self.window makeKeyAndVisible];
    return YES;
}


@end
