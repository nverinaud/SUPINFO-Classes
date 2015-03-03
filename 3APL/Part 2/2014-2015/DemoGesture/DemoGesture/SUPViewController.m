//
//  SUPViewController.m
//  DemoGesture
//
//  Created by Nicolas VERINAUD on 03/06/2014.
//  Copyright (c) 2014 Nicolas VERINAUD. All rights reserved.
//

#import "SUPViewController.h"

@interface SUPViewController () <UIGestureRecognizerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panGesture;
@property (strong, nonatomic) IBOutlet UILongPressGestureRecognizer *longPressGesture;

@end

@implementation SUPViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.longPressGesture.delegate = self;
	self.panGesture.delegate = self;
}

- (IBAction)longPressRecognized:(UILongPressGestureRecognizer *)sender
{
	if (sender.state == UIGestureRecognizerStateBegan)
	{
		self.editing = YES;
		
		[UIView animateWithDuration:0.3 animations:^{
			self.imageView.transform = CGAffineTransformMakeScale(1.3, 1.3);
			self.imageView.alpha = 0.3;
		}];
	}
	else if (sender.state == UIGestureRecognizerStateEnded)
	{
		self.editing = NO;
		
		[UIView animateWithDuration:0.3 animations:^{
			self.imageView.transform = CGAffineTransformIdentity;
			self.imageView.alpha = 1;
		}];
	}
}

- (IBAction)panGestureRecognized:(UIPanGestureRecognizer *)sender
{
	if (sender.state == UIGestureRecognizerStateChanged &&
		self.editing)
	{
		CGPoint translation = [sender translationInView:sender.view];
		
		CGPoint center = sender.view.center;
		center.x += translation.x;
		center.y += translation.y;
		sender.view.center = center;
		
		[sender setTranslation:CGPointZero inView:sender.view];
	}
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
	return YES;
}

@end













