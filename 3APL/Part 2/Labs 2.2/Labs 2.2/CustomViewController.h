//
//  CustomViewController.h
//  Labs 2.2
//
//  Created by Nicolas VERINAUD on 01/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomViewController : UIViewController

- (id)initWithCaption:(NSString *)caption andItem:(UITabBarItem *)item nibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil; // designated initializer
- (id)initWithCaption:(NSString *)caption andItem:(UITabBarItem *)item;
- (id)initWithCaption:(NSString *)caption;

@end
