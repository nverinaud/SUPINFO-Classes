//
//  PresentingViewController.m
//  Labs 2.3
//
//  Created by Nicolas VERINAUD on 01/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "PresentingViewController.h"
#import "PresentedViewController.h"

@interface PresentingViewController ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *button;

- (void)showNextView:(id)sender;

@end


@implementation PresentingViewController

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
	self.view.backgroundColor = [UIColor lightGrayColor];
	
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
		_label.text = NSLocalizedString(@"I am a presenting view controller !", @"Presenter speech");
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
		[_button setTitle:NSLocalizedString(@"Introduce your friend", @"Button text for introducing his friend...") forState:UIControlStateNormal];
		[_button addTarget:self action:@selector(showNextView:) forControlEvents:UIControlEventTouchUpInside];
	}
	
	return _button;
}


#pragma mark - Presentation

- (void)showNextView:(id)sender
{
	static UIModalTransitionStyle prezStyle = UIModalTransitionStyleCoverVertical;
	
	PresentedViewController *presentedVC = [[PresentedViewController alloc] init];
	presentedVC.modalTransitionStyle = prezStyle++;
	
	if (prezStyle > UIModalTransitionStylePartialCurl)
		prezStyle = UIModalTransitionStyleCoverVertical;
	
	[self presentViewController:presentedVC animated:YES completion:^{
		NSLog(@"Here is my friend !");
	}];
}

@end
