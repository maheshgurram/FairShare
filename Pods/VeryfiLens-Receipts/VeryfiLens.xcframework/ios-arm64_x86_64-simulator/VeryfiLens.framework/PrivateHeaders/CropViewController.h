//
//  CropViewController.h
//  test
//
//  Created by Ernest Semerda on 6/5/19.
//  Copyright © 2019 Ernest Semerda. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CropViewControllerDelegate <NSObject>
@required
- (void)refreshCollectionOfDocuments;
@end

@interface CropViewController : UIViewController 

@property IBOutlet UIImageView *cropImageView;

@property NSIndexPath *imageIndexPath;
@property UIImage *image;
@property void(^completion)(UIImage *);
@property (nonatomic) id <CropViewControllerDelegate> delegate;

@end
