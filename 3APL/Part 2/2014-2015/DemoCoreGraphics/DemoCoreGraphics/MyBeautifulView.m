//
//  MyBeautifulView.m
//  DemoCoreGraphics
//
//  Created by Nicolas VERINAUD on 04/03/15.
//  Copyright (c) 2015 Nicolas VERINAUD. All rights reserved.
//

#import "MyBeautifulView.h"

@implementation MyBeautifulView

- (void)drawRect:(CGRect)rect
{
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	
	CGMutablePathRef path = CGPathCreateMutable();
	
	CGPathMoveToPoint(path, NULL, 10, 100);
	CGPathAddLineToPoint(path, NULL, 100, 100);
	CGPathAddArcToPoint(path, NULL, 10, 10, 55, 100, 180 / M_PI);
	
	CGContextSetStrokeColorWithColor(ctx, UIColor.redColor.CGColor);
	CGContextAddPath(ctx, path);
	CGContextStrokePath(ctx);
	
	CGPathRelease(path);
}

@end




























