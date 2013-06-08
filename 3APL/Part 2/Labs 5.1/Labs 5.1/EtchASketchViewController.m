//
//  ViewController.m
//  Labs 5.1
//
//  Created by Nicolas VERINAUD on 05/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "EtchASketchViewController.h"
#import "SketchView.h"

@interface EtchASketchViewController ()

@property (nonatomic, weak) IBOutlet SketchView *drawSpaceView;
@property (nonatomic, weak) IBOutlet UIButton *upButton;
@property (nonatomic, weak) IBOutlet UIButton *downButton;
@property (nonatomic, weak) IBOutlet UIButton *leftButton;
@property (nonatomic, weak) IBOutlet UIButton *rightButton;
@property (nonatomic, weak) IBOutlet UILabel *eraseLabel;

@property (nonatomic, strong) NSTimer *upTimer;
@property (nonatomic, strong) NSTimer *downTimer;
@property (nonatomic, strong) NSTimer *leftTimer;
@property (nonatomic, strong) NSTimer *rightTimer;

- (IBAction)buttonPressed:(id)sender;
- (IBAction)buttonReleased:(id)sender;

@end


@implementation EtchASketchViewController

- (IBAction)buttonPressed:(id)sender
{
	NSRunLoop *mainRunLoop = [NSRunLoop mainRunLoop];
	NSTimeInterval fireInterval = 0.01;
	
	if (sender == self.upButton)
	{
		self.upTimer = [NSTimer timerWithTimeInterval:fireInterval target:self.drawSpaceView selector:@selector(goUp) userInfo:nil repeats:YES];
		[mainRunLoop addTimer:self.upTimer forMode:NSRunLoopCommonModes];
	}
	else if (sender == self.downButton)
	{
		self.downTimer = [NSTimer timerWithTimeInterval:fireInterval target:self.drawSpaceView selector:@selector(goDown) userInfo:nil repeats:YES];
		[mainRunLoop addTimer:self.downTimer forMode:NSRunLoopCommonModes];
	}
	else if (sender == self.leftButton)
	{
		self.leftTimer = [NSTimer timerWithTimeInterval:fireInterval target:self.drawSpaceView selector:@selector(goLeft) userInfo:nil repeats:YES];
		[mainRunLoop addTimer:self.leftTimer forMode:NSRunLoopCommonModes];
	}
	else if (sender == self.rightButton)
	{
		self.rightTimer = [NSTimer timerWithTimeInterval:fireInterval target:self.drawSpaceView selector:@selector(goRight) userInfo:nil repeats:YES];
		[mainRunLoop addTimer:self.rightTimer forMode:NSRunLoopCommonModes];
	}
}


- (IBAction)buttonReleased:(id)sender
{
	if (sender == self.upButton)
		[self.upTimer invalidate], self.upTimer = nil;
	else if (sender == self.downButton)
		[self.downTimer invalidate], self.downTimer = nil;
	else if (sender == self.leftButton)
		[self.leftTimer invalidate], self.leftTimer = nil;
	else if (sender == self.rightButton)
		[self.rightTimer invalidate], self.rightTimer = nil;
}


#pragma mark - Shake

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	
	[self becomeFirstResponder];
}


- (BOOL)canBecomeFirstResponder
{
	return YES;
}


- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake)
    {
        [self.drawSpaceView erase];
		
		self.eraseLabel.alpha = 1;
		[UIView animateWithDuration:1.2 animations:^{
			self.eraseLabel.alpha = 0;
		}];
	}
}

@end
