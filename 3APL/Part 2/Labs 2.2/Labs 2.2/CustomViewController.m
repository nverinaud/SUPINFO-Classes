//
//  CustomViewController.m
//  Labs 2.2
//
//  Created by Nicolas VERINAUD on 01/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "CustomViewController.h"

@interface CustomViewController ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, copy) NSString *caption;

@end



@implementation CustomViewController

#pragma mark - Memory management

- (void)dealloc
{
	[_label release];
	[_caption release];
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
}


#pragma mark - Creation
#pragma mark Designated initializer

- (id)initWithCaption:(NSString *)caption andItem:(UITabBarItem *)item nibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self)
	{
		self.caption = caption;
		self.title = self.caption;
		self.tabBarItem = item;
	}
	
	return self;
}


#pragma mark Convenient intializers

- (id)initWithCaption:(NSString *)caption
{
	return [self initWithCaption:caption andItem:nil nibName:nil bundle:nil];
}


- (id)initWithCaption:(NSString *)caption andItem:(UITabBarItem *)item
{
	return [self initWithCaption:caption andItem:item nibName:nil bundle:nil];
}


#pragma mark Overriden intializer

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	return [self initWithCaption:NSLocalizedString(@"No caption", nil) andItem:nil nibName:nibNameOrNil bundle:nibBundleOrNil];
}


#pragma mark - View lifecycle

- (void)loadView
{
	self.view = [[[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]] autorelease];
	self.view.backgroundColor = [UIColor lightGrayColor];
	
	[self.view addSubview:self.label];
}


#pragma mark - Lazy loaded views

- (UILabel *)label
{
	if (!_label)
	{
		_label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 64)];
		_label.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
		_label.textAlignment = NSTextAlignmentCenter;
		_label.font = [UIFont systemFontOfSize:20];
		_label.center = self.view.center;
		_label.text = NSLocalizedString(@"Test", nil);
	}
	
	return _label;
}

@end
