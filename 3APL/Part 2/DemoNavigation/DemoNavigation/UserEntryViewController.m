//
//  UserEntryViewController.m
//  DemoNavigation
//
//  Created by Nicolas VERINAUD on 04/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "UserEntryViewController.h"

@interface UserEntryViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textField;

@end


@implementation UserEntryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
	{
        
    }
	
    return self;
}


- (void)loadView
{
	self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	self.view.backgroundColor = [UIColor lightGrayColor];
	
	self.textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 50, CGRectGetWidth(self.view.bounds) - 50, 26)];
	self.textField.borderStyle = UITextBorderStyleRoundedRect;
	self.textField.delegate = self;
	self.textField.placeholder = @"Type here...";
	self.textField.center = CGPointMake(self.view.center.x, self.textField.center.y);
	self.textField.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleBottomMargin;
	
	if (_initialText)
		self.textField.text = _initialText;
	
	[self.view addSubview:self.textField];
}


- (void)setInitialText:(NSString *)initialText
{
	if (![initialText isEqualToString:_initialText])
	{
		_initialText = [initialText copy];
		
		if ([self isViewLoaded])
			self.textField.text = _initialText;
	}
}


- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	
	[self.textField becomeFirstResponder];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[self.delegate userEntryViewController:self didFinishWithEntryText:textField.text];
	[textField resignFirstResponder];
	return YES;
}

@end




















