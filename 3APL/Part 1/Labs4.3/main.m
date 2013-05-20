//
//  main.m
//  Labs4.3
//
//  Created by Nicolas VERINAUD on 18/05/13.
//  Copyright (c) 2013 Nicolas VERINAUD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TIFFImage.h"

int main(int argc, const char * argv[])
{

	@autoreleasepool {
		
		if (argc >= 2)
		{
			const char * imagePath = argv[1];
			TIFFImage *image = nil;
			int pixelsCount = 0;
			uint32_t *pixels;
			
			@try
			{
				image = [[TIFFImage alloc] initWithFilename:imagePath];
			}
			@catch (NSException *exception)
			{
				printf("Error: %s", [[exception reason] UTF8String]);
				return -1;
			}
			
			pixelsCount = image.width * image.height;
			pixels = image.pixels;
			
			printf("Image info:\n");
			printf("Size: %d * %d pixels (%d bits per pixel)\n", image.width, image.height, image.bpp);
			printf("\nImage data\n");
			
			for(int j = 0; j < image.height; j++)
			{
				for(int i = 0; i < image.width; i++)
				{
					uint32_t *p;
					p = pixels + (image.width * (image.bpp/8) * j) + (i * (image.bpp/8));
					
					for(int k = 0; k < image.bpp/8; k++)
						printf("%d", *(p+k));
				}
				printf("\n");
			}
		}
		else
		{
			printf("usage: %s source_file\n", argv[0]);
		}
	}
	
    return 0;
}

