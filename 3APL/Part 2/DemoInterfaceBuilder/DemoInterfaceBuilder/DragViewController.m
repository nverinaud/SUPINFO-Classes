//
//  DragViewController.m
//  DemoInterfaceBuilder
//
//  Created by Nicolas VERINAUD on 05/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "DragViewController.h"

static NSString *StringFromGestureState(UIGestureRecognizerState state)
{
	switch (state)
	{
		case UIGestureRecognizerStateBegan:
			return @"Began";
			break;
			
		case UIGestureRecognizerStateCancelled:
			return @"Cancelled";
			break;
			
		case UIGestureRecognizerStateChanged:
			return @"Changed";
			break;
			
		case UIGestureRecognizerStateEnded:
			return @"Ended";
			break;
			
		case UIGestureRecognizerStateFailed:
			return @"Failed";
			break;
			
		case UIGestureRecognizerStatePossible:
			return @"Possible";
			break;
	}
	
	return @"";
}

@interface DragViewController () <UIGestureRecognizerDelegate>

- (IBAction)longPressed:(UILongPressGestureRecognizer *)sender;
- (IBAction)panned:(UIPanGestureRecognizer *)sender;
- (IBAction)rotate:(UIRotationGestureRecognizer *)sender;

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imageViews;


@end


@implementation DragViewController

- (IBAction)longPressed:(UILongPressGestureRecognizer *)sender
{
	if (sender.state == UIGestureRecognizerStateBegan)
	{
		self.editing = YES;
		[self.view bringSubviewToFront:sender.view];
		[UIView animateWithDuration:0.3 animations:^{
			sender.view.alpha = 0.6;
			sender.view.transform = CGAffineTransformMakeScale(1.3, 1.3);
		}];
	}
	else if (sender.state == UIGestureRecognizerStateEnded)
	{
		self.editing = NO;
		[UIView animateWithDuration:0.3 animations:^{
			sender.view.alpha = 1;
			sender.view.transform = CGAffineTransformIdentity;
		}];
	}
	
	
//	NSLog(@"Long press state: %@", StringFromGestureState(sender.state));
}

- (IBAction)panned:(UIPanGestureRecognizer *)sender
{
	if (sender.state == UIGestureRecognizerStateChanged && [self isEditing])
	{
		CGPoint translation = [sender translationInView:sender.view];
		
//		NSLog(@"Translation: %@", NSStringFromCGPoint(translation));
		
		CGPoint center = sender.view.center;
		center.x += translation.x;
		center.y += translation.y;
		sender.view.center = center;
		
		[sender setTranslation:CGPointZero inView:sender.view];
	}
	
//	NSLog(@"Pan state: %@", StringFromGestureState(sender.state));
}

- (IBAction)rotate:(UIRotationGestureRecognizer *)sender
{
	if (sender.state == UIGestureRecognizerStateChanged)
	{
		for (UIImageView *imageView in self.imageViews)
			imageView.transform = CGAffineTransformMakeRotation(sender.rotation);
	}
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
	return YES;
}


@end













