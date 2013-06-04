//
//  HelloViewController.m
//  Labs 1
//
//  Created by Nicolas VERINAUD on 01/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "HelloViewController.h"

@interface HelloViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UILabel *helloLabel; /* 1.3 */

- (void)buttonToggle:(UIButton *)sender; /* 1.2 */

@end


#define HELLO_WORLD_TEXT @"Hello World !"


@implementation HelloViewController

#pragma mark - Memory Management

- (void)dealloc
{
	[_helloLabel release];
	[super dealloc];
}


- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
}

#pragma mark - Creation
#pragma mark Designated overriden initializer

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
	{
        // Nothing special to do here, we could remove this initializer...
    }
	
    return self;
}


#pragma mark - View lifecycle

- (void)loadView
{
	self.view = [[[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]] autorelease];
	
	/* 1.1 */
	UILabel *helloLabel = [[UILabel alloc] initWithFrame:self.view.bounds];
	helloLabel.text = HELLO_WORLD_TEXT;
	helloLabel.textAlignment = NSTextAlignmentCenter;
	helloLabel.backgroundColor = [UIColor clearColor];
	helloLabel.opaque = NO;
	helloLabel.font = [UIFont systemFontOfSize:32.f];
	helloLabel.textColor = [UIColor whiteColor];
	helloLabel.shadowColor = [UIColor darkGrayColor];
	helloLabel.shadowOffset = CGSizeMake(2, 2);
	self.helloLabel = helloLabel;
	[helloLabel release];
	
	[self.view addSubview:self.helloLabel];
	
	/* 1.2 */
	[self.helloLabel sizeToFit];
	self.helloLabel.center = CGPointMake(self.view.center.x, CGRectGetHeight(self.view.bounds) * 1/3);
	
	
	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	button.frame = CGRectMake(0, 0, 200, 44);
	button.center = CGPointMake(self.view.center.x, CGRectGetHeight(self.view.bounds) - CGRectGetHeight(button.bounds) - 10);
	[button setTitle:HELLO_WORLD_TEXT forState:UIControlStateNormal];
	[button addTarget:self action:@selector(buttonToggle:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];
	
	/* 1.3 */
	UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.helloLabel.frame) + 20, 200, 30)];
	textField.center = CGPointMake(self.view.center.x, textField.center.y);
	textField.delegate = self;
	textField.borderStyle = UITextBorderStyleRoundedRect;
	textField.placeholder = @"Enter your name";
	[self.view addSubview:textField];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	
	// Nothing special to do here too...
}


#pragma mark - Button toggle
/* 1.2 */
- (void)buttonToggle:(UIButton *)sender
{
	if ([[sender titleForState:UIControlStateNormal] isEqualToString:HELLO_WORLD_TEXT])
		[sender setTitle:@"Hi there !" forState:UIControlStateNormal];
	else
		[sender setTitle:HELLO_WORLD_TEXT forState:UIControlStateNormal];
}


#pragma mark - UITextField delegate
/* 1.3 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	self.helloLabel.text = [@"Hi " stringByAppendingString:textField.text];
	[textField resignFirstResponder];
	return YES;
}

@end
