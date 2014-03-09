//
//  RealTIFFImage.h
//  Labs4.3
//
//  Created by Nicolas VERINAUD on 19/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RealTIFFImage : NSObject
{
	uint32_t _height;
	uint32_t _width;
	uint8_t _bpp;
	uint32_t *_pixels;
}

@property (nonatomic, readonly, assign) uint32_t height;
@property (nonatomic, readonly, assign) uint32_t width;
@property (nonatomic, readonly, assign) uint8_t bpp; // bits per pixel
@property (nonatomic, readonly, assign) uint32_t *pixels;

+ (RealTIFFImage *)loadFromFile:(const char *)filename;

@end
