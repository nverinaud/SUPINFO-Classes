//
//  ViewController.m
//  DemoCoreGraphics
//
//  Created by Nicolas VERINAUD on 04/03/15.
//  Copyright (c) 2015 Nicolas VERINAUD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) CALayer *myLayer;
@property (strong, nonatomic) IBOutlet UILabel *valueLabel;

@property (nonatomic, strong) CADisplayLink *displayLink;
@property (strong, nonatomic) IBOutlet UIView *moveMeView;

@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.myLayer = [[CALayer alloc] init];
	self.myLayer.frame = (CGRect){
		.size.width = 100,
		.size.height = 100,
		.origin.x = 50,
		.origin.y = 50
	};
	
	[self.view.layer addSublayer:self.myLayer];
	
	self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLoop)];
	[self.displayLink addToRunLoop:NSRunLoop.currentRunLoop forMode:NSRunLoopCommonModes];
}

- (IBAction)doAnimation
{
	[CATransaction begin];
	[CATransaction setAnimationDuration:5];
	
	self.myLayer.backgroundColor = UIColor.yellowColor.CGColor;
	self.myLayer.borderColor = UIColor.blackColor.CGColor;
	self.myLayer.cornerRadius = 20;
	self.myLayer.borderWidth = 5;
	self.myLayer.transform = CATransform3DMakeRotation(M_PI / 2, 0, 0, 1);
	
	[CATransaction commit];
	
	[UIView animateWithDuration:5 animations:^{
		CGRect frame = self.moveMeView.frame;
		frame.origin.y = 400;
		self.moveMeView.frame = frame;
	}];
}

- (void)displayLoop
{
	CGFloat cornerRadius = ((CALayer *)self.myLayer.presentationLayer).cornerRadius;
	self.valueLabel.text = [NSString stringWithFormat:@"%.4f", cornerRadius];
}

@end















