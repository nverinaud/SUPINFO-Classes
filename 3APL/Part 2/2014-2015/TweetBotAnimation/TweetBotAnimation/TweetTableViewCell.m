//
//  TweetTableViewCell.m
//  TweetBotAnimation
//
//  Created by Nicolas VERINAUD on 03/03/15.
//  Copyright (c) 2015 Nicolas VERINAUD. All rights reserved.
//

#import "TweetTableViewCell.h"

@interface TweetTableViewCell ()

@property (strong, nonatomic) IBOutlet UIToolbar *toolbar;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *toolbarTrailing;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *toolbarLeading;
@property (strong, nonatomic) IBOutlet UIView *openedBackgroundView;

@end

@implementation TweetTableViewCell

+ (UINib *)nib
{
	return [UINib nibWithNibName:NSStringFromClass(self) bundle:nil];
}

+ (CGFloat)heightOpened:(BOOL)opened
{
	return opened ? 144 : 100;
}

- (void)awakeFromNib
{
	[super awakeFromNib];
	
	self.layoutMargins = UIEdgeInsetsZero;
	self.separatorInset = UIEdgeInsetsZero;

	CATransform3D rotate = CATransform3DMakeRotation(M_PI, 0, M_PI_2, 0);
	self.toolbar.layer.transform = rotate;
	
//	self.toolbarLeading.constant = CGRectGetWidth(self.contentView.bounds);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
	[super setSelected:selected animated:animated];
	
	[self animateOpen:selected duration:0.3];
}

- (void)animateOpen:(BOOL)open duration:(NSTimeInterval)duration
{
//	[self.contentView removeConstraint:self.toolbarLeading];
//	[self.contentView removeConstraint:self.toolbarTrailing];
//	
//	self.toolbarLeading.constant = open ? 0 : CGRectGetWidth(self.contentView.bounds);
//	self.toolbarTrailing.constant = open ? 0 : -CGRectGetWidth(self.contentView.bounds);
//	
//	[self.contentView addConstraint:self.toolbarLeading];
//	[self.contentView addConstraint:self.toolbarTrailing];
//	
//	[self.contentView setNeedsLayout];
	
	[UIView animateWithDuration:duration animations:^{
//		[self.contentView layoutIfNeeded];
		self.openedBackgroundView.alpha = open;
		[self.contentView sendSubviewToBack:self.openedBackgroundView];
		self.toolbar.layer.transform = CATransform3DIdentity;
	}];
}

@end









