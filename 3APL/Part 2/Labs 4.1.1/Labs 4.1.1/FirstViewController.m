//
//  FirstViewController.m
//  Labs 4.1.1
//
//  Created by Nicolas VERINAUD on 04/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *button;

- (IBAction)goToSecond:(UIButton *)sender;

@end

@implementation FirstViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.title = @"First";
}


- (IBAction)goToSecond:(UIButton *)sender
{
	SecondViewController *secondVC = [[SecondViewController alloc] init];
	[self.navigationController pushViewController:secondVC animated:YES];
}

@end
