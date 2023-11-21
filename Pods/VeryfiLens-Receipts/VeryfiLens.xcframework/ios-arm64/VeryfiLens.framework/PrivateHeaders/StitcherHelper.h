//
//  Stitcher.h
//  Veryfi-Lens
//
//  Copyright © 2020 Veryfi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreVideo/CoreVideo.h"
#import "AVFoundation/AVFoundation.h"
#import "RectangleFeature.h"
#import "ImageProcessorDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@protocol ImageProcessorDelegate;

typedef void (^StitcherHelperCompletion)(UIImage * _Nullable image);

@interface StitcherHelper : NSObject
@property(nonatomic) BOOL isStitching;
@property(nonatomic, weak) id<ImageProcessorDelegate> delegate;
- (void)clean;
- (instancetype)init;
- (void)processBuffer:(CVImageBufferRef)buffer;
- (void)processImage:(UIImage *)image;
- (UIImage *)stitchedImage;
- (int)getMergedCount;
- (void)start;
- (void)stopWithCompletion:(StitcherHelperCompletion)completion;
@end

NS_ASSUME_NONNULL_END
