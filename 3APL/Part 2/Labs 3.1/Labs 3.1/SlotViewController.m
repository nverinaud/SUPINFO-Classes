//
//  SlotViewController.m
//  Labs 3.1
//
//  Created by Nicolas VERINAUD on 03/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "SlotViewController.h"

@interface SlotViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, strong) NSArray *imageGroups;

- (UIImage *)imageForRow:(NSInteger)row inComponent:(NSInteger)component;

@end


@implementation SlotViewController

- (void)loadView
{
	self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	self.view.backgroundColor = [UIColor lightGrayColor];
	
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 44)];
	label.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
	label.backgroundColor = [UIColor clearColor];
	label.text = @"Chance Time !";
	label.textAlignment = NSTextAlignmentCenter;
	label.center = self.view.center;
	[self.view addSubview:label];
	
	self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.bounds) - 180, CGRectGetWidth(self.view.bounds), 180)];
	self.pickerView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth;
	self.pickerView.delegate = self;
	self.pickerView.dataSource = self;
	[self.view addSubview:self.pickerView];
}

#define NUMBER_OF_SLOTS 9

- (NSArray *)imageGroups
{
	if (!_imageGroups)
	{
		NSMutableArray *groups = [[NSMutableArray alloc] initWithCapacity:3];
		NSMutableArray *slots = nil;
		UIImage *image = nil;
		int k = 0;
		
		for (int i = 0; i < 3; i++)
		{
			slots = [[NSMutableArray alloc] initWithCapacity:NUMBER_OF_SLOTS];
			k = 0;
			
			for (int j = 0; j < NUMBER_OF_SLOTS; j++)
			{
				if (i == 1)
					k = NUMBER_OF_SLOTS - j - 1;
				
				image = [UIImage imageNamed:[NSString stringWithFormat:@"slot-%d", k]];
				[slots addObject:image];
				
				k++;
			}
			
			[groups addObject:[NSArray arrayWithArray:slots]];
		}
		
		_imageGroups = [[NSArray alloc] initWithArray:groups];
	}
	
	return _imageGroups;
}


- (UIImage *)imageForRow:(NSInteger)row inComponent:(NSInteger)component
{
	return self.imageGroups[component][row];
}


#pragma mark - UIPickerView dataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return self.imageGroups.count;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return [self.imageGroups[component] count];
}


#pragma mark - UIPickerView delegate

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
	return (CGFloat)CGRectGetWidth(pickerView.bounds) / 3.f;
}


- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
	return 64.f;
}


- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIImageView *)view
{
	if (!view)
	{
		view = [[UIImageView alloc] init];
		view.contentMode = UIViewContentModeScaleAspectFit;
		view.backgroundColor = [UIColor clearColor];
	}
	
	view.image = [self imageForRow:row inComponent:component];
	
	return view;
}

@end
