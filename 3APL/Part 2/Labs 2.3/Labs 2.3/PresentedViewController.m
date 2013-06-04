//
//  PresentedViewController.m
//  Labs 2.3
//
//  Created by Nicolas VERINAUD on 01/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "PresentedViewController.h"

@interface PresentedViewController ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *button;

- (void)closePresentedView:(id)sender;

@end


@implementation PresentedViewController

- (void)dealloc
{
	[_label release];
	[_button release];
	[super dealloc];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
}


- (void)viewDidUnload
{
	[super viewDidUnload];
	
	self.label = nil;
	self.button = nil;
}


#pragma mark - View lifecycle

- (void)loadView
{
	self.view = [[[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]] autorelease];
	self.view.backgroundColor = [UIColor underPageBackgroundColor];
	
	[self.view addSubview:self.label];
	[self.view addSubview:self.button];
}


#pragma mark - Lazy loaded views

- (UILabel *)label
{
	if (!_label)
	{
		_label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 44)];
		_label.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
		_label.textAlignment = NSTextAlignmentCenter;
		_label.font = [UIFont systemFontOfSize:20];
		_label.center = self.view.center;
		_label.text = NSLocalizedString(@"I am a presented view controller !", @"Friend speech");
	}
	
	return _label;
}


- (UIButton *)button
{
	if (!_button)
	{
		_button = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
		_button.frame = CGRectMake(0, CGRectGetMaxY(_label.frame) + 10, 200, 44);
		_button.center = CGPointMake(self.view.center.x, _button.center.y);
		[_button setTitle:NSLocalizedString(@"Give up !", @"Button text for friend gaving up...") forState:UIControlStateNormal];
		[_button addTarget:self action:@selector(closePresentedView:) forControlEvents:UIControlEventTouchUpInside];
	}
	
	return _button;
}


#pragma mark - Presentation

- (void)closePresentedView:(id)sender
{
	[self.presentingViewController dismissViewControllerAnimated:YES completion:^{
		NSLog(@"I gave up !");
	}];
}

@end
