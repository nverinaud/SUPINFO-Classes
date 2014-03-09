//
//  TIFFImage.h
//  Labs4.3
//
//  Created by Nicolas VERINAUD on 19/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RealTIFFImage;

@interface TIFFImage : NSObject
{
	uint32_t _height;
	uint32_t _width;
	uint8_t _bpp;
	char *_filename;
	RealTIFFImage *_image;
}

@property (nonatomic, readonly) uint32_t height;
@property (nonatomic, readonly) uint32_t width;
@property (nonatomic, readonly) uint8_t bpp; // bits per pixel
@property (nonatomic, readonly) uint32_t *pixels;

- (id)initWithFilename:(const char *)filename;

@end
