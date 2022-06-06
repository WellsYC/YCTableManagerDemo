//
//  TableController.h
//  Demo
//
//  Created by 蔡亚超 on 2018/12/27.
//  Copyright © 2018 WellsCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YCTableDataSource;
@interface TableController : NSObject
@property(nonatomic,strong)UITableView             *tableView;
@property(nonatomic,strong)YCTableDataSource       *tableDataSource;

- (void)reloadData:(NSArray *)persons;
@end
