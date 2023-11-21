//
//  ImageProcessor.h
//  Veryfi-Lens
//
//  Copyright © 2021 Veryfi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VeryfiLensSwift.h"
#import "StitcherHelper.h"
#import <VeryfiLens/CardDetectorHelper.h>
#import "CheckDetectorHelper.h"
#import "DocumentDetectorHelper.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    CardDetectorMode,
    CheckDetectorMode,
    DocumentDetectorMode,
    StitchingMode,
    ImageProcessorModeNone
} ImageProcessorMode;


@interface ImageProcessor : NSObject
@property (nonatomic) BOOL isAutoRotationOn;
@property BOOL stopProcessingBuffer;
@property DocumentType documentType;
@property UIDeviceOrientation deviceOrientation;
@property (nonatomic, weak) id<ImageProcessorDelegate> delegate;
@property BOOL shouldStartStitching;
@property ImageProcessorMode imageProcessorMode;
@property StitcherHelper *stitcherHelper;
@property CardDetectorHelper *cardDetectorHelper;
@property DocumentDetectorHelper *documentDetectorHelper;
@property CheckDetectorHelper *checkDetectorHelper;

- (instancetype)init;
- (void)processImage:(UIImage *)image;
- (void)processGalleryImage:(UIImage *)image;
- (void)processBuffer:(CMSampleBufferRef)sampleBuffer;
- (void)startStitching;
- (void)stopStitching;
- (BOOL)isAutoCaptureEnabled;
- (void)enableChecksBackCapture:(BOOL)isEnabled;
@end

NS_ASSUME_NONNULL_END
