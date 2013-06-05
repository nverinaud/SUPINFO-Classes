//
//  SettingsViewController.m
//  Labs 4.1.4.1
//
//  Created by Nicolas VERINAUD on 04/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *ringLabel;
@property (weak, nonatomic) IBOutlet UISwitch *ringSwitch;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *vibrateLabel;
@property (weak, nonatomic) IBOutlet UISwitch *vibrateSwitch;

- (IBAction)switchValueChanged:(UISwitch *)sender;
- (IBAction)sliderValueChanged:(UISlider *)sender;

@end


@implementation SettingsViewController

- (IBAction)switchValueChanged:(UISwitch *)sender
{
	
}


- (IBAction)sliderValueChanged:(UISlider *)sender
{
	
}

@end
