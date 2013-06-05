//
//  MyViewController.m
//  DemoInterfaceBuilder
//
//  Created by Nicolas VERINAUD on 05/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (nonatomic, weak) IBOutlet UILabel *secondLabel;

- (IBAction)buttonTouched:(UIButton *)sender;

@end


@implementation MyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	self.label.text = @"Awesome !";
}

#define TOUCH_ME_BUTTON_TAG 10
#define DONT_TOUCH_ME_BUTTON_TAG 11

- (IBAction)buttonTouched:(UIButton *)sender
{
	switch (sender.tag)
	{
		case TOUCH_ME_BUTTON_TAG:
		{
			[sender setTitle:@"You touched me ! GG !" forState:UIControlStateNormal];
			break;
		}
			
		case DONT_TOUCH_ME_BUTTON_TAG:
		{
			[sender setTitle:@"You touched me! TOO BAD !" forState:UIControlStateNormal];
			[sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
			break;
		}
			
		default:
			break;
	}
	
	NSLog(@"%@", [sender titleForState:UIControlStateNormal]);
}

@end


















