//
//  MyViewController.m
//  DemoXIB
//
//  Created by Nicolas VERINAUD on 03/03/15.
//  Copyright (c) 2015 Nicolas VERINAUD. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@property (nonatomic, strong) IBOutlet UILabel *awesomeLabel;
@property (strong, nonatomic) IBOutlet UIButton *clickMeButton;

- (IBAction)buttonClicked:(UIButton *)sender;
- (IBAction)sliderValueChanged;

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *OtherLabels;


@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)sliderValueChanged {
}
@end
