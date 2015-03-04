//
//  TweetTableViewCell.h
//  TweetBotAnimation
//
//  Created by Nicolas VERINAUD on 03/03/15.
//  Copyright (c) 2015 Nicolas VERINAUD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TweetTableViewCell : UITableViewCell

+ (UINib *)nib;

+ (CGFloat)heightOpened:(BOOL)opened;

@end
