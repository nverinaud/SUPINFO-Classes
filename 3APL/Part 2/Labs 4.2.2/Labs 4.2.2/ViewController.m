//
//  ViewController.m
//  Labs 4.2.2
//
//  Created by Nicolas VERINAUD on 04/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (void)triggerSegue:(NSTimer *)aTimer;

@end


@implementation ViewController

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	
	NSTimer *timer = [NSTimer timerWithTimeInterval:3 target:self selector:@selector(triggerSegue:) userInfo:nil repeats:NO];
	[[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}


- (void)triggerSegue:(NSTimer *)aTimer
{
	[self performSegueWithIdentifier:@"MySegue" sender:self];
}

@end
