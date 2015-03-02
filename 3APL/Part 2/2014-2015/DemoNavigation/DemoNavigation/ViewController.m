//
//  ViewController.m
//  DemoNavigation
//
//  Created by Nicolas VERINAUD on 02/03/15.
//  Copyright (c) 2015 Nicolas VERINAUD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (instancetype)init
{
	self = [super init];
	
	if (self)
	{
		self.count = 1;
		
		self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(incrementCount)];
		
//		self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"—" style:UIBarButtonItemStylePlain target:self action:@selector(decrementCount)];
		
		UIBarButtonItem *resetButton = [[UIBarButtonItem alloc] initWithTitle:@"Reset" style:UIBarButtonItemStylePlain target:self action:@selector(resetCount)];
		
		UIBarButtonItem *presentButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(actionButtonTapped)];
		
		self.toolbarItems = @[
		  resetButton,
		  [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
		  presentButton
		];
	}
	
	return self;
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	[self.navigationController setToolbarHidden:NO animated:animated];
}

- (void)loadView
{
	self.view = [[UIView alloc] initWithFrame:UIScreen.mainScreen.bounds];
	
	self.view.backgroundColor = [UIColor whiteColor];
}

- (void)setCount:(NSInteger)count
{
	_count = count;
	self.title = [NSString stringWithFormat:@"Hello %d", _count];
	self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:_count+3 tag:0];
	self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d", _count];
}

- (void)incrementCount
{
	ViewController *nextViewController = [[ViewController alloc] init];
	nextViewController.count = self.count + 1;
	
	[self.navigationController pushViewController:nextViewController
										 animated:YES];
}

- (void)decrementCount
{
	[self.navigationController popViewControllerAnimated:YES];
}

- (void)resetCount
{
	self.count = 1;
}

- (void)actionButtonTapped
{
	UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:@[ [NSURL URLWithString:@"http://google.com"] ] applicationActivities:nil];
	[self presentViewController:activityVC animated:YES completion:nil];
}

@end













