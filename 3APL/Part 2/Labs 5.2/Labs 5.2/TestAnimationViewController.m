//
//  ViewController.m
//  Labs 5.2
//
//  Created by Nicolas VERINAUD on 05/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "TestAnimationViewController.h"

@interface TestAnimationViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *button;

- (IBAction)buttonPressed:(UIButton *)sender;

@property (nonatomic, strong) CALayer *customLayer;

@end


@implementation TestAnimationViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.customLayer = [[CALayer alloc] init];
	self.customLayer.backgroundColor = [[UIColor blueColor] CGColor];
	self.customLayer.frame = CGRectInset(self.view.bounds, 100, 210);
	
	[self.view.layer addSublayer:self.customLayer];
}


- (IBAction)buttonPressed:(UIButton *)sender
{
	// Custom Layer
	[CATransaction begin];
	[CATransaction setAnimationDuration:3];
	[CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
	
	self.customLayer.backgroundColor = [[UIColor redColor] CGColor];
	self.customLayer.transform = CATransform3DMakeTranslation(-50, -100, 0);
	self.customLayer.cornerRadius = 30.f;
	self.customLayer.borderColor = [[UIColor whiteColor] CGColor];
	self.customLayer.borderWidth = 5.f;
	self.customLayer.shadowColor = [[UIColor darkGrayColor] CGColor];
	self.customLayer.shadowOffset = CGSizeMake(10, 10);
	self.customLayer.shadowRadius = 5.f;
	self.customLayer.shadowOpacity = 0.8;
	self.customLayer.opacity = 0.5;
	
	[CATransaction commit];
	
	// Label
	CATransform3D rotation = CATransform3DMakeRotation(M_PI, 1, 1, 0);
	CATransform3D scale = CATransform3DMakeScale(2.0, 2.0, 0.1);
	CATransform3D transform = CATransform3DConcat(rotation, scale);
	
	[UIView animateWithDuration:1 animations:^{
		[CATransaction begin];
		[CATransaction setAnimationDuration:1];
		
		self.label.layer.cornerRadius = 15.f;
		self.label.layer.transform = transform;
		
		[CATransaction commit];
	}];
}

@end
