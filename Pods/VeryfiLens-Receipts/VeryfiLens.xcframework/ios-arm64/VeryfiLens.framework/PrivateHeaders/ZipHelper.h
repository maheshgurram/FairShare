//
//  ZipHelper.h
//  Veryfi-Lens
//
//  Created by Alex Levnikov on 17.08.21.
//  Copyright © 2021 Veryfi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZipHelper : NSObject
+(BOOL)zipAtPath: (NSString *_Nonnull) path
      outputPath: (NSString *_Nonnull) outputPath;
+(BOOL)unzipAtPath: (NSString *_Nonnull) path
        outputPath: (NSString *_Nonnull) outputPath;
@end

NS_ASSUME_NONNULL_END
