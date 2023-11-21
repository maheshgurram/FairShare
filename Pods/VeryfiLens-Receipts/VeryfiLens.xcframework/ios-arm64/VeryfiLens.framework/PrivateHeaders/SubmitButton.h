//
//  SubmitButton.h
//  Veryfi-Lens
//
//  Created by Alex Levnikov on 1/20/21.
//  Copyright © 2021 Veryfi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubmitButton : UIView

- (instancetype _Nonnull)initWithFrame:(CGRect)frame title: (NSString *) title backgroundColor: (UIColor *) backgroundColor textColor: (UIColor *) textColor cornerRadius: (CGFloat) cornerRadius  borderColor: (UIColor *) borderColor didTouchBlock:(void(^)(id)) didTouchBlock;
- (void)startAnimating;
- (void)stopAnimating;

@end

