//
//  AppDelegate.m
//  DemoWindow
//
//  Created by Nicolas VERINAUD on 02/03/15.
//  Copyright (c) 2015 Nicolas VERINAUD. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	CGRect windowFrame = [[UIScreen mainScreen] bounds];
	self.window = [[UIWindow alloc] initWithFrame:windowFrame];
	self.window.backgroundColor = UIColor.redColor;
	
	UIView *carreBlanc = [[UIView alloc] initWithFrame:(CGRect){
		.size.width = 100,
		.size.height = 100,
		.origin.x = 30,
		.origin.y = 30
	}];
	carreBlanc.clipsToBounds = YES;
	carreBlanc.backgroundColor = UIColor.whiteColor;
	
	[self.window addSubview:carreBlanc];
	
	UIControl *carreJaune = [[UIControl alloc] initWithFrame:(CGRect){
		.size.width = 200,
		.size.height = 200,
		.origin.x = 30,
		.origin.y = 30
	}];
	carreJaune.backgroundColor = UIColor.yellowColor;
	
	[carreJaune addTarget:self action:@selector(carreJauneClicked:event:) forControlEvents:UIControlEventTouchUpInside|UIControlEventTouchUpOutside];
	
	[carreBlanc addSubview:carreJaune];
	
	CGRect carreJauneFrame = carreJaune.frame;
	carreJauneFrame.size.width = 50;
	carreJauneFrame.size.height = 50;
	carreJaune.frame = carreJauneFrame;
	
	[self.window makeKeyAndVisible];
	
	return YES;
}

- (void)carreJauneClicked:(id)sender event:(UIEvent *)event
{
	NSLog(@"Sender: %@, Event: %@", sender, event);
//	NSLog(@"Sender: %@", sender);
//	NSLog(@"Clicked !");
}

@end













