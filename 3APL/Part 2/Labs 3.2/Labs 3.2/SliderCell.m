//
//  SliderCell.m
//  Labs 3.2
//
//  Created by Nicolas VERINAUD on 03/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "SliderCell.h"

@interface SliderCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UISlider *slider;
@property (nonatomic, strong) UILabel *detailsLabel;
@property (nonatomic, strong) UILabel *sliderValueLabel;

- (void)sliderValueChanged:(UISlider *)sender;

@end


@implementation SliderCell

+ (CGFloat)optimizedHeight
{
	return 100;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
	{
		self.selectionStyle = UITableViewCellSelectionStyleNone;
		
        [self.contentView addSubview:self.titleLabel];
		[self.contentView addSubview:self.slider];
		[self.contentView addSubview:self.detailsLabel];
		[self.contentView addSubview:self.sliderValueLabel];
		
		[self sliderValueChanged:self.slider];
    }
	
    return self;
}


#pragma mark - Lazy views

- (UILabel *)textLabel
{
	return self.titleLabel;
}


- (UILabel *)detailTextLabel
{
	return nil;
}


- (UILabel *)titleLabel
{
	if (!_titleLabel)
	{
		_titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, CGRectGetWidth(self.contentView.bounds) - 20, 20)];
		_titleLabel.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleWidth;
		_titleLabel.text = @"Slider Cell";
		_titleLabel.font = [UIFont boldSystemFontOfSize:17.f];
		_titleLabel.backgroundColor = [UIColor clearColor];
		_titleLabel.opaque = NO;
	}
	
	return _titleLabel;
}


- (UISlider *)slider
{
	if (!_slider)
	{
		_slider = [[UISlider alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.titleLabel.frame), CGRectGetMaxY(self.titleLabel.frame) + 5, CGRectGetWidth(self.titleLabel.bounds), 20)];
		_slider.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleWidth;
		[_slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
		_slider.continuous = YES;
		_slider.value = 0.5;
	}
	
	return _slider;
}


- (UILabel *)detailsLabel
{
	if (!_detailsLabel)
	{
		_detailsLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.titleLabel.frame), CGRectGetMaxY(self.slider.frame) + 10, CGRectGetWidth(self.titleLabel.bounds) / 2, 20)];
		_detailsLabel.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleWidth;
		_detailsLabel.text = @"Slider value:";
		_detailsLabel.textAlignment = NSTextAlignmentRight;
		_detailsLabel.font = [UIFont systemFontOfSize:15.f];
		_detailsLabel.backgroundColor = [UIColor clearColor];
		_detailsLabel.opaque = NO;
	}
	
	return _detailsLabel;
}


- (UILabel *)sliderValueLabel
{
	if (!_sliderValueLabel)
	{
		_sliderValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.detailsLabel.frame), CGRectGetMinY(self.detailsLabel.frame), CGRectGetWidth(self.detailsLabel.bounds), 20)];
		_sliderValueLabel.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleWidth;
		_sliderValueLabel.text = @"0.00";
		_sliderValueLabel.textAlignment = NSTextAlignmentLeft;
		_sliderValueLabel.font = [UIFont systemFontOfSize:15.f];
		_sliderValueLabel.backgroundColor = [UIColor clearColor];
		_sliderValueLabel.opaque = NO;
	}
	
	return _sliderValueLabel;
}



#pragma mark - Slider value changed

- (void)sliderValueChanged:(UISlider *)sender
{
	self.sliderValueLabel.text = [NSString stringWithFormat:@"%.2f", sender.value];
	
	if (_onSliderValueChanged)
		_onSliderValueChanged(sender.value);
}


#pragma mark - Value

- (void)setValue:(CGFloat)value
{
	self.slider.value = value;
	[self sliderValueChanged:self.slider];
}


- (CGFloat)value
{
	return self.slider.value;
}

@end
