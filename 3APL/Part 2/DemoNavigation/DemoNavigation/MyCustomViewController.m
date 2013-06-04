//
//  MyCustomViewController.m
//  DemoNavigation
//
//  Created by Nicolas VERINAUD on 04/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "MyCustomViewController.h"
#import "UserEntryViewController.h"

@interface MyCustomViewController () <UserEntryViewControllerDelegate>

@property (nonatomic, strong) UILabel *label;

- (void)pageCurl:(id)sender;

@end


@implementation MyCustomViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
	{
        self.title = @"Welcome";
    }
	
    return self;
}


- (void)loadView
{
	self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	self.view.backgroundColor = [UIColor lightGrayColor];
	self.view.clipsToBounds = YES;
	
	NSLog(@"%@", NSStringFromCGRect(self.view.frame));
	
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.bounds) - 40, CGRectGetWidth(self.view.bounds), 40)];
	label.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth;
	label.backgroundColor = [UIColor redColor];
	label.text = @"Hello World !";
	label.textColor = [UIColor whiteColor];
	label.shadowColor = [UIColor darkGrayColor];
	label.shadowOffset = CGSizeMake(0, -1);
	label.textAlignment = NSTextAlignmentCenter;
	[self.view addSubview:label];
	self.label = label;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.navigationItem.rightBarButtonItem = self.editButtonItem;
	self.toolbarItems = @[
		[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
		[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(pageCurl:)]
    ];
}


- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	[self.navigationController setToolbarHidden:NO animated:animated];
}


- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	
	NSLog(@"%@", NSStringFromCGRect(self.view.frame));
	NSLog(@"%@", NSStringFromCGRect(self.label.frame));
}


- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
	[super setEditing:editing animated:animated];
	
	if (editing)
	{
		[UIView animateWithDuration:0.5 animations:^{
			self.label.transform = CGAffineTransformConcat(CGAffineTransformMakeTranslation(-200, 0), CGAffineTransformMakeRotation(90));
		}];
	}
	else
	{
		[UIView animateWithDuration:0.5 animations:^{
			self.label.transform = CGAffineTransformIdentity;
		}];
	}
}


- (void)pageCurl:(id)sender
{
	UserEntryViewController *userEntryVC = [[UserEntryViewController alloc] init];
	userEntryVC.delegate = self;
	userEntryVC.initialText = self.label.text;
	userEntryVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentViewController:userEntryVC animated:YES completion:nil];
}


- (void)userEntryViewController:(UserEntryViewController *)userEntryVC
		 didFinishWithEntryText:(NSString *)text
{
	self.label.text = text;
	[userEntryVC.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end












