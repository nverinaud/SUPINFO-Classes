//
//  BananaReflectView.m
//  DemoCoreGraphics
//
//  Created by Nicolas VERINAUD on 05/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "BananaReflectView.h"

@interface BananaReflectView ()

@property (nonatomic, strong) UIImage *image;

@end



@implementation BananaReflectView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
	{
        self.image = [UIImage imageNamed:@"banana"];
    }
	
    return self;
}

- (void)drawRect:(CGRect)rect
{
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	
	CGRect imageRect = rect;
	imageRect.size.height /= 2;
	
	CGRect reflectRect = rect;
	reflectRect.size.height /= 2;
	reflectRect.origin.y = reflectRect.size.height;
	
	CGContextSetFillColorWithColor(ctx, [[UIColor whiteColor] CGColor]);
	CGContextFillRect(ctx, rect);
	
	CGContextSaveGState(ctx);
	CGContextTranslateCTM(ctx, 0, CGRectGetHeight(imageRect));
	CGContextScaleCTM(ctx, 1, -1);
	CGContextDrawImage(ctx, imageRect, self.image.CGImage);
	CGContextRestoreGState(ctx);
	
	CGContextDrawImage(ctx, reflectRect, self.image.CGImage);
}


@end













