//
//  ViewController.m
//  Labs 4.3
//
//  Created by Nicolas VERINAUD on 04/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)gestured:(UIPanGestureRecognizer *)sender;

@end


@implementation ViewController

- (void)gestured:(UIPanGestureRecognizer *)sender
{
	if (sender.state == UIGestureRecognizerStateBegan)
	{
		[self performSegueWithIdentifier:@"MySegue" sender:sender];
	}
}

@end
