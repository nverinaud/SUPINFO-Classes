//
//  ViewController.m
//  DemoTextField
//
//  Created by Nicolas VERINAUD on 03/03/15.
//  Copyright (c) 2015 Nicolas VERINAUD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.textField = [[UITextField alloc] initWithFrame:(CGRect){
		.size.width = self.view.bounds.size.width - 40,
		.size.height = 32
	}];
	self.textField.center = self.view.center;
	self.textField.placeholder = @"Enter your email";
	self.textField.keyboardType = UIKeyboardTypeEmailAddress;
	
	self.textField.delegate = self;
	
	[self.view addSubview:self.textField];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}

@end






















