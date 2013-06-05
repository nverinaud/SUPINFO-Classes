//
//  SuperCell.h
//  Labs 4.1.4.2
//
//  Created by Nicolas VERINAUD on 04/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuperCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UIImageView *superImageView;
@property (nonatomic, strong) IBOutlet UILabel *superLabel;
@property (nonatomic, strong) IBOutlet UISlider *superSlider;

@end
