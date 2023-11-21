//
//  STagsTableViewController.h
//  ManhattanProject
//
//  Created by Ernest
//

#import <UIKit/UIKit.h>

@class VeryfiLensTag;

@interface STagsTableViewController : UITableViewController <UISearchBarDelegate>

@property NSString *onlyPassBack; // we only want the value to pass back, no api calls to save
@property BOOL hasAccountingCA;

@property (nonatomic, copy) void (^completion)(VeryfiLensTag *);

@end
