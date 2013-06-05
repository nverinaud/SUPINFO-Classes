//
//  MyCustomCell.m
//  DemoInterfaceBuilder
//
//  Created by Nicolas VERINAUD on 05/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "MyCustomCell.h"

@implementation MyCustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
	{
        self.stepperLabel.text = @"";
    }
	
    return self;
}

- (IBAction)stepperValueChanged:(UIStepper *)sender
{
	self.stepperLabel.text = [NSString stringWithFormat:@"%.f", sender.value];
}
@end
