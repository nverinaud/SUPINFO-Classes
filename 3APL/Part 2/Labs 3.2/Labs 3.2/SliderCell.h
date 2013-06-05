//
//  SliderCell.h
//  Labs 3.2
//
//  Created by Nicolas VERINAUD on 03/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SliderCellValueChangedBlock)(float value);

@interface SliderCell : UITableViewCell

@property (nonatomic, assign) CGFloat value;
@property (nonatomic, copy) SliderCellValueChangedBlock onSliderValueChanged;
- (void)setOnSliderValueChanged:(SliderCellValueChangedBlock)onSliderValueChanged;

+ (CGFloat)optimizedHeight;

@end
