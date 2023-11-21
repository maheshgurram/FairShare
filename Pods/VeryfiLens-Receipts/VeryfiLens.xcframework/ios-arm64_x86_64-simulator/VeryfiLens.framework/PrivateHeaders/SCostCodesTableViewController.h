//
//  SCostCodesTableViewController.h
//  ManhattanProject
//
//  Created by Ernest
//

#import <UIKit/UIKit.h>

@class VeryfiLensCostCode;

@protocol SCostCodesTableViewControllerDelegate <NSObject>
- (void)updateCostCode:(VeryfiLensCostCode *)costCode;
@end

@interface SCostCodesTableViewController : UITableViewController <UISearchBarDelegate>

@property (nonatomic, copy) void (^completion)(VeryfiLensCostCode *);

@end
