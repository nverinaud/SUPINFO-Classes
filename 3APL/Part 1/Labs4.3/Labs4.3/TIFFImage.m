//
//  TIFFImage.m
//  Labs4.3
//
//  Created by Nicolas VERINAUD on 19/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <tiffio.h>
#import "TIFFImage.h"
#import "RealTIFFImage.h"

@interface TIFFImage ()

@property (nonatomic, readwrite, assign) uint32_t height;
@property (nonatomic, readwrite, assign) uint32_t width;
@property (nonatomic, readwrite, assign) uint8_t bpp; // bits per pixel
@property (nonatomic, strong) RealTIFFImage *backedImage;

@end


@implementation TIFFImage

@synthesize height = _height;
@synthesize width = _width;
@synthesize bpp = _bpp;

@dynamic pixels;


- (void)dealloc
{
	if (_filename)
		free(_filename);
	
	[super dealloc];
}


- (id)initWithFilename:(const char *)filename
{
	self = [super init];
	if (self)
	{
		TIFF *tif = NULL;
		uint32_t h, w;
		uint8_t bpp;
		int bps, spp;
		
		tif = TIFFOpen(filename, "r");
		if (tif)
		{
			TIFFGetField(tif, TIFFTAG_IMAGEWIDTH, &w);
			TIFFGetField(tif, TIFFTAG_IMAGELENGTH, &h);
			TIFFGetField(tif, TIFFTAG_SAMPLESPERPIXEL, &spp);
			TIFFGetField(tif, TIFFTAG_BITSPERSAMPLE, &bps);
			
			bpp = spp * bps;
			
			self.height = h;
			self.width = w;
			self.bpp = bpp;
			_filename = strdup(filename);
			
			TIFFClose(tif);
		}
		else
		{
			@throw [NSException exceptionWithName:@"TIFFImageException"
										   reason:[NSString stringWithFormat:@"Unable to open file with filename: %s. (File may not exists.)", filename]
										 userInfo:nil];
		}
	}
	
	return self;
}


- (RealTIFFImage *)backedImage
{
	if (!_backedImage)
		_backedImage = [RealTIFFImage loadFromFile:_filename];
	
	return _backedImage;
}


- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
	if ([self respondsToSelector:aSelector])
		return [super methodSignatureForSelector:aSelector];
	else if ([self.backedImage respondsToSelector:aSelector])
		return [self.backedImage methodSignatureForSelector:aSelector];
	
	return nil;
}


- (void)forwardInvocation:(NSInvocation *)anInvocation
{	
	if ([self.backedImage respondsToSelector:[anInvocation selector]])
		[anInvocation invokeWithTarget:self.backedImage];
	else
		[super forwardInvocation:anInvocation];
}

@end
