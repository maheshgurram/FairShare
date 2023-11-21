//
//  SCategoriesTableViewController.h
//  ManhattanProject
//
//  Created by Ernest
//

#import <UIKit/UIKit.h>
@class VeryfiLensCategory;

@interface SCategoriesTableViewController :  UITableViewController <UISearchBarDelegate>

@property (nonatomic, copy) void (^completion)(VeryfiLensCategory *);


@end
