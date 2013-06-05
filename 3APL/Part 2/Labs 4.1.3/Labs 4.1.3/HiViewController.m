//
//  HiViewController.m
//  Labs 4.1.3
//
//  Created by Nicolas VERINAUD on 04/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "HiViewController.h"

@interface HiViewController ()

@property (nonatomic, weak) IBOutlet UILabel *label;

- (IBAction)sayHi:(id)sender;

@end


@implementation HiViewController

- (void)sayHi:(id)sender
{
	self.label.text = @"Hi You !";
}

@end
