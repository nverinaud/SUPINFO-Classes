//
//  UserEntryViewController.h
//  DemoNavigation
//
//  Created by Nicolas VERINAUD on 04/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UserEntryViewControllerDelegate;


@interface UserEntryViewController : UIViewController

@property (nonatomic, weak) id<UserEntryViewControllerDelegate> delegate;
@property (nonatomic, copy) NSString *initialText;

@end


@protocol UserEntryViewControllerDelegate <NSObject>
@required
- (void)userEntryViewController:(UserEntryViewController *)userEntryVC didFinishWithEntryText:(NSString *)text;

@end
