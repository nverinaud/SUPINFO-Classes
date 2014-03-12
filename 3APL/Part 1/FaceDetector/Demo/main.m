
#import <Foundation/Foundation.h>
#import <Quartz/Quartz.h>

int main(int argc, const char * argv[])
{
	@autoreleasepool
	{
		NSArray *urls = @[
		  @"http://lorempixel.com/1920/1080?i=1",
		  @"http://lorempixel.com/1920/1080?i=2",
		  @"http://lorempixel.com/1920/1080?i=3",
		  @"http://lorempixel.com/1920/1080?i=4",
		  @"http://lorempixel.com/1920/1080?i=5",
		  @"http://lorempixel.com/1920/1080?i=6",
		  @"http://lorempixel.com/1920/1080?i=7",
		  @"http://lorempixel.com/1920/1080?i=8",
		  @"http://lorempixel.com/1920/1080?i=9"
		];
		
		NSOperationQueue *queue = [[NSOperationQueue alloc] init];
		queue.name = @"My DL Q";
		
		NSOperation *dlOperation;
		NSOperation *faceDetectOperation;
		NSString *filePath;
		
		for (NSString *url in urls)
		{
			filePath = [[NSTemporaryDirectory() stringByAppendingPathComponent:[[NSUUID UUID] UUIDString]] stringByAppendingPathExtension:@"jpg"];
			
			NSLog(@"Filepath for %@ is %@", url, filePath);
			
			dlOperation = [NSBlockOperation blockOperationWithBlock:^{
				NSLog(@"Downloading %@...", url);
				NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
				[imageData writeToFile:filePath atomically:YES];
				NSLog(@"Download finished for %@", url);
			}];
			
			faceDetectOperation = [NSBlockOperation blockOperationWithBlock:^{
				NSURL *fileURL = [NSURL fileURLWithPath:filePath];
				CIImage *image = [[CIImage alloc] initWithContentsOfURL:fileURL];
				CGContextRef ctx = CGBitmapContextCreate(NULL, 1920, 1080, 8, 0, CGColorSpaceCreateDeviceRGB(), kCGImageAlphaPremultipliedFirst);
				CIContext *context = [CIContext contextWithCGContext:ctx options:nil];
				NSDictionary *opts = @{ CIDetectorAccuracy : CIDetectorAccuracyHigh };
				CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeFace context:context options:opts];
				NSArray *features = [detector featuresInImage:image options:nil];
				
				NSLog(@"Detecting %lu faces in %@", features.count, filePath);
				
				CGColorRef red = CGColorCreateGenericRGB(1, 0, 0, 1);
				
				CGContextDrawImage(ctx, CGRectMake(0, 0, 1920, 1080), [context createCGImage:image fromRect:image.extent]);
				
				for (CIFaceFeature *f in features)
				{
					CGContextSetStrokeColorWithColor(ctx, red);
					CGContextSetLineWidth(ctx, 4);
					
					NSLog(@"%@", NSStringFromRect(f.bounds));
					
					CGContextStrokeRect(ctx, f.bounds);
					
					if (f.hasLeftEyePosition)
						NSLog(@"Left eye %g %g", f.leftEyePosition.x, f.leftEyePosition.y);
					
					if (f.hasRightEyePosition)
						NSLog(@"Right eye %g %g", f.rightEyePosition.x, f.rightEyePosition.y);
					
					if (f.hasMouthPosition)
						NSLog(@"Mouth %g %g", f.mouthPosition.x, f.mouthPosition.y);
				}
				
				CGImageRef img = CGBitmapContextCreateImage(ctx);
				CGImageDestinationRef dest = CGImageDestinationCreateWithURL((__bridge CFURLRef)fileURL, kUTTypeJPEG, 1, NULL);
				CGImageDestinationAddImage(dest, img, NULL);
				CGImageDestinationFinalize(dest);
				CGImageRelease(img);
				CFRelease(dest);
				CGColorRelease(red);
				
				CGContextRelease(ctx);
			}];
			
			[faceDetectOperation addDependency:dlOperation];
			[queue addOperation:faceDetectOperation];
			[queue addOperation:dlOperation];
		}
		
		[queue waitUntilAllOperationsAreFinished];
	}
	
    return 0;
}

















