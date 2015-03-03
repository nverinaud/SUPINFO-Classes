//
//  ViewController.m
//  DemoScrollView
//
//  Created by Nicolas VERINAUD on 03/03/15.
//  Copyright (c) 2015 Nicolas VERINAUD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIView *blueView;
@property (nonatomic, strong) UIView *whiteView;
@property (nonatomic, strong) UIView *redView;

@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.view.backgroundColor = UIColor.blackColor;
	
	self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
	self.scrollView.bounces = YES;
	self.scrollView.alwaysBounceHorizontal = YES;
	
	self.blueView = [[UIView alloc] initWithFrame:self.view.bounds];
	self.blueView.backgroundColor = UIColor.blueColor;
	
	self.whiteView = [[UIView alloc] initWithFrame:(CGRect){
		.size = self.view.bounds.size,
		.origin.x = CGRectGetMaxX(self.blueView.frame)
	}];
	self.whiteView.backgroundColor = UIColor.whiteColor;
	
	self.redView = [[UIView alloc] initWithFrame:(CGRect){
		.size = self.view.bounds.size,
		.origin.x = CGRectGetMaxX(self.whiteView.frame)
	}];
	self.redView.backgroundColor = UIColor.redColor;
	
	self.contentView = [[UIView alloc] initWithFrame:(CGRect){
		.size.height = self.view.bounds.size.height,
		.size.width = CGRectGetMaxX(self.redView.frame)
	}];
	self.contentView.opaque = NO;
	self.contentView.backgroundColor = UIColor.clearColor;
	
	[self.contentView addSubview:self.blueView];
	[self.contentView addSubview:self.whiteView];
	[self.contentView addSubview:self.redView];
	
	[self.scrollView addSubview:self.contentView];
	
	self.scrollView.contentSize = self.contentView.bounds.size;
	
	self.scrollView.delegate = self;
	self.scrollView.minimumZoomScale = 0.33f;
	self.scrollView.maximumZoomScale = 2.0f;
	
//	self.scrollView.pagingEnabled = YES;
	
	[self.view addSubview:self.scrollView];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
	return self.contentView;
}

@end



















