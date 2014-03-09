//
//  RealTIFFImage.m
//  Labs4.3
//
//  Created by Nicolas VERINAUD on 19/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "RealTIFFImage.h"
#import <tiffio.h>

@interface RealTIFFImage ()

@property (nonatomic, readwrite, assign) uint32_t height;
@property (nonatomic, readwrite, assign) uint32_t width;
@property (nonatomic, readwrite, assign) uint8_t bpp; // bits per pixel
@property (nonatomic, readwrite, assign) uint32_t *pixels;

- (id)initWithWidth:(uint32_t)width height:(uint32_t)height andBpp:(uint8_t)bpp;

@end



@implementation RealTIFFImage

@synthesize height = _height;
@synthesize width = _width;
@synthesize bpp = _bpp;
@synthesize pixels = _pixels;

- (id)initWithWidth:(uint32_t)width height:(uint32_t)height andBpp:(uint8_t)bpp
{
	self = [super init];
	if (self)
	{
		self.width = width;
		self.height = height;
		self.bpp = bpp;
		_pixels = malloc(width * height * (_bpp / 8) * sizeof(uint32_t));
	}
	
	return self;
}


+ (RealTIFFImage *)loadFromFile:(const char *)filename
{
	TIFF *tif = NULL;
	uint32_t h, w;
	uint8_t bpp;
	int bps, spp;
	RealTIFFImage *image = nil;
	
	tif = TIFFOpen(filename, "r");
	if (tif)
	{
		TIFFGetField(tif, TIFFTAG_IMAGEWIDTH, &w);
		TIFFGetField(tif, TIFFTAG_IMAGELENGTH, &h);
		TIFFGetField(tif, TIFFTAG_SAMPLESPERPIXEL, &spp);
		TIFFGetField(tif, TIFFTAG_BITSPERSAMPLE, &bps);
		
		bpp = spp * bps;
		
		image = [[RealTIFFImage alloc] initWithWidth:w height:h andBpp:bpp];
		TIFFReadRGBAImageOriented(tif, w, h, (uint32_t*)image->_pixels, ORIENTATION_TOPLEFT, 0);
		TIFFClose(tif);
	}
	
	return image;
}


- (void)dealloc
{
	if (_pixels)
		free(_pixels), _pixels = NULL;
	
	[super dealloc];
}

@end
