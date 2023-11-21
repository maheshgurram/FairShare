//
//  SFusedCPTableViewController.h
//  ManhattanProject
//

#import <UIKit/UIKit.h>

@class VeryfiLensCPModel;

@interface SFusedCPTableViewController : UITableViewController <UISearchBarDelegate, UISearchControllerDelegate>

@property (nonatomic, copy) void (^completion)(VeryfiLensCPModel *);

@end
