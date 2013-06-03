//
//  ConversionOperation.m
//  Labs7.2
//
//  Created by Nicolas VERINAUD on 25/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import "ConversionOperation.h"
#import <wand/MagickWand.h>

@interface ConversionOperation ()

@property (nonatomic, copy) NSString *filename;
@property (nonatomic, copy) NSString *convertedFilename;

@end


@implementation ConversionOperation

@synthesize filename = _filename;
@synthesize convertedFilename = _convertedFileName;

- (void)dealloc
{
	[_filename release];
	[_convertedFileName release];
	
	[super dealloc];
}


- (id)initWithFile:(NSString *)filename
{
	self = [super init];
	if (self)
	{
		self.filename = filename;
	}
	
	return self;
}


- (void)setFilename:(NSString *)filename
{
	if (![filename isEqualToString:_filename])
	{
		[_filename release];
		_filename = [filename copy];
		
		self.convertedFilename = [[[_filename stringByDeletingPathExtension] stringByAppendingString:@"-128"] stringByAppendingPathExtension:@"png"];
	}
}


- (void)main
{
	@autoreleasepool
	{
		MagickBooleanType status;
		MagickWand *wand = NULL;
		
		MagickWandGenesis();
		wand = NewMagickWand();
		status = MagickReadImage(wand, self.filename.UTF8String);
		if (status == MagickFalse)
		{
			NSLog(@"Error reading file: %@", self.filename);
		}
		else
		{			
			NSLog(@"Start converting %@ to %@...", self.filename, self.convertedFilename);
			
			MagickResetIterator(wand);
			while (MagickNextImage(wand) != MagickFalse)
				MagickResizeImage(wand, 128, 128, LanczosFilter, 1.0);
			
			status = MagickWriteImages(wand, self.convertedFilename.UTF8String, MagickTrue);
			
			if (status == MagickFalse)
				NSLog(@"Error saving file: %@.", self.convertedFilename);
			
			NSLog(@"Finish converting %@ to %@.", self.filename, self.convertedFilename);
			
			wand = DestroyMagickWand(wand);
		}
		
		MagickWandTerminus();
	}
}

@end
