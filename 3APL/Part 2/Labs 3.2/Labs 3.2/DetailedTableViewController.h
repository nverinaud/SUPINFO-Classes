//
//  DetailedTableViewController.h
//  Labs 3.2
//
//  Created by Nicolas VERINAUD on 03/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FooItem;

@interface DetailedTableViewController : UITableViewController

@property (nonatomic, strong) FooItem *item;

@end
