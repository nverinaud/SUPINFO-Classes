//
//  EmitterView.m
//  DemoEmitterLayer
//
//  Created by Nicolas VERINAUD on 05/06/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "EmitterView.h"

@interface EmitterView ()

- (void)performDefaultInit;

@end


@implementation EmitterView

- (void)performDefaultInit
{
	CAEmitterLayer *layer = (CAEmitterLayer *)self.layer;
	CAEmitterCell *cell = [CAEmitterCell emitterCell];
	cell.birthRate = 10;
	cell.velocity = 50;
	cell.velocityRange = 15;
	cell.lifetime = 10;
	cell.yAcceleration = 50;
	cell.emissionLongitude = -M_PI; // up
	cell.emissionRange = M_PI / 4; // 90 degree cone for variety
	cell.scale = 1.0;
	cell.scaleSpeed = 1.0;
	cell.scaleRange = 0.5;
	cell.spin = 3.f;
	cell.spinRange = 0.5f;
	
	cell.color = [[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1.0] CGColor];
	cell.redRange = 1.0;
	cell.redSpeed = 0.5;
	cell.blueRange = 1.0;
	cell.blueSpeed = 0.5;
	cell.greenRange = 1.0;
	cell.greenSpeed = 0.5;
	cell.alphaSpeed = -0.2;
	
	cell.name = @"Cell";
	cell.contents = (__bridge id)[[UIImage imageNamed:@"banana"] CGImage];
	layer.emitterCells = @[	cell ];
	layer.emitterPosition = CGPointMake(self.center.x, self.center.y / 2);
	layer.emitterShape = kCAEmitterLayerSphere;
	layer.emitterSize = self.bounds.size;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
	{
		[self performDefaultInit];
    }
    
	return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self)
	{
		[self performDefaultInit];
	}
	
	return self;
}


+ (Class)layerClass
{
	return [CAEmitterLayer class];
}

@end










