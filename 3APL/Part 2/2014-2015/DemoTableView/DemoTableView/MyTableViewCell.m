//
//  MyTableViewCell.m
//  DemoTableView
//
//  Created by Nicolas VERINAUD on 03/03/15.
//  Copyright (c) 2015 Nicolas VERINAUD. All rights reserved.
//

#import "MyTableViewCell.h"

@interface MyTableViewCell ()

@property (nonatomic, readwrite, strong) UILabel *titleLabel;

@end

@implementation MyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	
	if (self)
	{
		self.textLabel.hidden = YES;
		self.detailTextLabel.hidden = YES;
		
		self.titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
		self.titleLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
		
		self.titleLabel.textColor = UIColor.redColor;
		self.titleLabel.textAlignment = NSTextAlignmentCenter;
		
		[self.contentView addSubview:self.titleLabel];
	}
	
	return self;
}



@end
















