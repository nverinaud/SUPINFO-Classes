//
//  AppDelegate.m
//  Labs 2.3
//
//  Created by Nicolas VERINAUD on 01/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "AppDelegate.h"
#import "PresentingViewController.h"

@implementation AppDelegate

- (void)dealloc
{
	[_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    self.window.rootViewController = [[[PresentingViewController alloc] init] autorelease];
	
    [self.window makeKeyAndVisible];
	
    return YES;
}

@end
