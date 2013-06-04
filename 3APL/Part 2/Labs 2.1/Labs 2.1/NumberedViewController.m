//
//  NumberedViewController.m
//  Labs 2.1
//
//  Created by Nicolas VERINAUD on 01/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "NumberedViewController.h"

@interface NumberedViewController ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *button;

- (void)continueToNextView:(id)sender;
- (void)doAmazingStuff:(id)sender;

@end


@implementation NumberedViewController

#pragma mark - Memory management

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


- (void)viewDidLoad
{
	[super viewDidLoad];
	
	NSString *buttonTitle = [NSString stringWithFormat:[self.button titleForState:UIControlStateNormal], self.number];
	[self.button setTitle:buttonTitle forState:UIControlStateNormal];
	
	self.label.text = [NSString stringWithFormat:self.label.text, self.number];
	
	self.title = self.label.text;
}


- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Amazing", nil)
																   style:UIBarButtonItemStyleBordered
																  target:self
																  action:@selector(doAmazingStuff:)];
	self.toolbarItems = @[ buttonItem ];
	[buttonItem release];
	
	[self.navigationController setToolbarHidden:NO animated:animated];
	
	self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
	[super setEditing:editing animated:animated];
	
	self.label.text = editing ? NSLocalizedString(@"In editing mode", nil) : NSLocalizedString(@"Not in editing mode", nil);
}


#pragma mark - Lazy loaded views

- (UILabel *)label
{
	if (!_label)
	{
		_label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 64)];
		_label.autoresizingMask = UIViewAutoresizingFlexibleTopMargin; // indique comment la vue se déplace et/ou se redimenssionne dans sa supervue si la supervue est redimensionnée, ici la marge haute est flexible donc le label remonte quand la hauteur de la supervue diminue et descend quand la hauteur de la supervue augmente.
		_label.textAlignment = NSTextAlignmentCenter;
		_label.font = [UIFont systemFontOfSize:20];
		_label.center = self.view.center;
		_label.text = NSLocalizedString(@"View %d", @"The view number $1");
	}
	
	return _label;
}


- (UIButton *)button
{
	if (!_button)
	{
		_button = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
		_button.frame = CGRectMake(0, CGRectGetMaxY(_label.frame) + 10, 100, 44);
		_button.center = CGPointMake(self.view.center.x, _button.center.y);
		[_button setTitle:NSLocalizedString(@"Go to view %d", @"Button text for going far away...") forState:UIControlStateNormal];
		[_button addTarget:self action:@selector(continueToNextView:) forControlEvents:UIControlEventTouchUpInside];
	}
	
	return _button;
}


#pragma mark - Navigating

- (void)continueToNextView:(id)sender
{
	NumberedViewController *numberedVC = [[NumberedViewController alloc] init];
	numberedVC.number = self.number + 1;
	[self.navigationController pushViewController:numberedVC animated:YES];
	[numberedVC release];
}


#pragma mark - Doing something really amazing

- (void)doAmazingStuff:(id)sender
{
	self.label.text = NSLocalizedString(@"Amazing !!!", @"An amazing text of your own...");
	
	self.label.backgroundColor = [UIColor colorWithRed:(CGFloat)(rand()%255)/255
												 green:(CGFloat)(rand()%255)/255
												  blue:(CGFloat)(rand()%255)/255
												 alpha:1];

	self.label.textColor = [UIColor colorWithRed:(CGFloat)(rand()%255)/255
										   green:(CGFloat)(rand()%255)/255
											blue:(CGFloat)(rand()%255)/255
										   alpha:1];
}

@end
