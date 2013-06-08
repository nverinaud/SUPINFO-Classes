//
//  SketchView.m
//  Labs 5.1
//
//  Created by Nicolas VERINAUD on 05/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "SketchView.h"

@interface SketchView ()

@property (nonatomic, readonly) CGMutablePathRef path;

- (void)performDefaultInit;

@end


@implementation SketchView

@synthesize path = _path;

#pragma mark - Memory management

- (void)dealloc
{
	if (_path)
		CGPathRelease(_path); // We must manually release Core Foundation types, ARC can't do that for us
}


#pragma mark - Creation

- (void)performDefaultInit
{
	_cursorX = CGRectGetMidX(self.bounds);
	_cursorY = CGRectGetMidY(self.bounds);
	_speed = 1.0f;
	CGPathMoveToPoint(self.path, NULL, _cursorX, _cursorY);
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
        [self performDefaultInit];
	
    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder // When created from an nib
{
	self = [super initWithCoder:aDecoder];
	if (self)
		[self performDefaultInit];
	
	return self;
}


#pragma mark - Path & movements

- (CGMutablePathRef)path
{
	if (_path == NULL)
		_path = CGPathCreateMutable();
	
	return _path;
}


- (void)setCursorX:(CGFloat)cursorX
{
	if (cursorX != _cursorX && (0 <= cursorX && cursorX <= CGRectGetMaxX(self.bounds)))
	{
		_cursorX = cursorX;
		
		CGPathAddLineToPoint(self.path, NULL, _cursorX, _cursorY);
		[self setNeedsDisplay];
	}
}


- (void)setCursorY:(CGFloat)cursorY
{
	if (cursorY != _cursorY && (0 <= cursorY && cursorY <= CGRectGetMaxY(self.bounds)))
	{
		_cursorY = cursorY;
		
		CGPathAddLineToPoint(self.path, NULL, _cursorX, _cursorY);
		[self setNeedsDisplay];
	}
}


- (void)goUp
{
	self.cursorY -= self.speed;
}


- (void)goDown
{
	self.cursorY += self.speed;
}


- (void)goLeft
{
	self.cursorX -= self.speed;
}


- (void)goRight
{
	self.cursorX += self.speed;
}


- (void)erase
{
	if (_path)
	{
		CGPathRelease(_path);
		_path = NULL;
	}
	
	[self performDefaultInit];
	[self setNeedsDisplay];
}


#pragma mark - Drawing

- (void)drawRect:(CGRect)rect
{
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGRect cursorRect = CGRectMake(_cursorX-2, _cursorY-2, 4, 4);
	
	// Draw cursor
	CGContextSetStrokeColorWithColor(ctx, [[UIColor redColor] CGColor]);
	CGContextSetFillColorWithColor(ctx, [[UIColor redColor] CGColor]);
	CGContextAddEllipseInRect(ctx, cursorRect);
	CGContextStrokePath(ctx);
	CGContextAddEllipseInRect(ctx, cursorRect);
	CGContextFillPath(ctx);
	
	// Draw path
	CGContextSetStrokeColorWithColor(ctx, [[UIColor blackColor] CGColor]);
	CGContextSetFillColorWithColor(ctx, [[UIColor blackColor] CGColor]);
	CGContextAddPath(ctx, self.path);
	CGContextStrokePath(ctx);
}

@end














