//
//  ViewController.m
//  DemoCoreGraphics
//
//  Created by Nicolas VERINAUD on 05/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "ViewController.h"
#import "BananaReflectView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)loadView
{
	self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
}


- (void)viewDidLoad
{
	[super viewDidLoad];
	
	BananaReflectView *bananaRV = [[BananaReflectView alloc] initWithFrame:CGRectMake(50, 50, 100, 176)];
	[self.view addSubview:bananaRV];
}


- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	
	CALayer *layer = [[CALayer alloc] init];
	layer.frame = CGRectMake(50, 276, 100, 100);
	layer.backgroundColor = [[UIColor redColor] CGColor];
	[self.view.layer addSublayer:layer];
	
	double delayInSeconds = 0.1;
	dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
	dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
		[CATransaction begin];
		[CATransaction setAnimationDuration:5];
		[CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
		
		layer.backgroundColor = [[UIColor blueColor] CGColor];
		layer.borderWidth = 20;
		layer.borderColor = [[UIColor redColor] CGColor];
		layer.cornerRadius = 20;
		layer.transform = CATransform3DConcat(CATransform3DMakeScale(-1, -1, 1), CATransform3DMakeScale(-1, -1, -1));
		
		[CATransaction commit];
	});
}

@end



















