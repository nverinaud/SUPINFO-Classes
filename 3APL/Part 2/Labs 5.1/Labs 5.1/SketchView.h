//
//  SketchView.h
//  Labs 5.1
//
//  Created by Nicolas VERINAUD on 05/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SketchView : UIView

@property (nonatomic, assign) CGFloat cursorX;
@property (nonatomic, assign) CGFloat cursorY;
@property (nonatomic, assign) CGFloat speed;

- (void)goUp;
- (void)goDown;
- (void)goLeft;
- (void)goRight;
- (void)erase;

@end
