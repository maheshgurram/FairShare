//
//  SNotesViewController.h
//  ManhattanProject
//

#import <UIKit/UIKit.h>

@interface SNotesViewController : UIViewController <UITextViewDelegate>

@property (nonatomic) NSString *notes;
@property (nonatomic, copy) void (^completion)(NSString *);

@end
