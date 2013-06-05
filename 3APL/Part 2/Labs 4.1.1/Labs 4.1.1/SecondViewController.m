//
//  SecondViewController.m
//  Labs 4.1.1
//
//  Created by Nicolas VERINAUD on 04/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *button;

- (IBAction)goBack:(UIButton *)sender;

@end


@implementation SecondViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.title = @"Second";
	self.navigationItem.hidesBackButton = YES;
}

- (IBAction)goBack:(UIButton *)sender
{
	[self.navigationController popViewControllerAnimated:YES];
}

@end
