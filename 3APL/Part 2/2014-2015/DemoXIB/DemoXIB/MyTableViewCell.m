//
//  MyTableViewCell.m
//  DemoXIB
//
//  Created by Nicolas VERINAUD on 03/03/15.
//  Copyright (c) 2015 Nicolas VERINAUD. All rights reserved.
//

#import "MyTableViewCell.h"

@interface MyTableViewCell ()

@property (strong, readwrite, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, readwrite, nonatomic) IBOutlet UILabel *subtitleLabel;
@property (strong, readwrite, nonatomic) IBOutlet UILabel *chapoLabel;

@end

@implementation MyTableViewCell

- (void)awakeFromNib
{
	self.titleLabel.text = @"";
	self.subtitleLabel.text = @"";
	self.chapoLabel.text = @"";
}

@end














