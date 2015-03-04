//
//  AppDelegate.m
//  TweetBotAnimation
//
//  Created by Nicolas VERINAUD on 03/03/15.
//  Copyright (c) 2015 Nicolas VERINAUD. All rights reserved.
//

#import "AppDelegate.h"
#import "TweetsTableViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) UINavigationController *navController;
@property (nonatomic, strong) TweetsTableViewController *tweetsVC;

@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
	
	self.tweetsVC = [TweetsTableViewController new];
	self.navController = [[UINavigationController alloc] initWithRootViewController:self.tweetsVC];
	self.window.rootViewController = self.navController;
	
	[self.window makeKeyAndVisible];
	
	return YES;
}

@end











