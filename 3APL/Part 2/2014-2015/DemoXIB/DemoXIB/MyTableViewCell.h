//
//  MyTableViewCell.h
//  DemoXIB
//
//  Created by Nicolas VERINAUD on 03/03/15.
//  Copyright (c) 2015 Nicolas VERINAUD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell

@property (strong, readonly, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, readonly, nonatomic) IBOutlet UILabel *subtitleLabel;
@property (strong, readonly, nonatomic) IBOutlet UILabel *chapoLabel;

@end
