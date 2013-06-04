//
//  AppDelegate.m
//  Labs 1.4
//
//  Created by Nicolas VERINAUD on 01/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@implementation AppDelegate

- (void)dealloc
{
	[_window release];
	[_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];

	self.viewController = [[[ViewController alloc] initWithNibName:nil bundle:nil] autorelease];
	self.window.rootViewController = self.viewController;
    
	[self.window makeKeyAndVisible];
	
	[self.viewController updateClock:nil];
	
    return YES;
}

@end
