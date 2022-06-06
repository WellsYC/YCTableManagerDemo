//
//  YCTableDataSource.h
//  Demo
//
//  Created by 蔡亚超 on 2018/12/22.
//  Copyright © 2018 WellsCai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableDataProtocol.h"


typedef void(^ConfigureCellBlock)(UITableViewCell *cell,id<TableDataProtocol>item);
typedef void(^DidSelectCellBlock)(UITableView *tableView,NSIndexPath *indexPath);

@interface YCTableDataSource : NSObject<UITableViewDelegate,UITableViewDataSource>


@property(nonatomic,copy)NSArray<TableDataProtocol> *         items;

- (instancetype)initWithItems:(NSArray<TableDataProtocol> *)items configureCellBlock:(ConfigureCellBlock)configureBlock didSelectCellBlock:(DidSelectCellBlock)didSelectBlock;

@end
