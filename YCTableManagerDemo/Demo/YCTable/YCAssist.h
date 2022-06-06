//
//  YCAssist.h
//  Demo
//
//  Created by 蔡亚超 on 2018/12/6.
//  Copyright © 2018年 WellsCai. All rights reserved.
//


@class YCBaseRow,YCBaseSection;

// 设置cell
typedef UITableViewCell*(^YCCellForRowBlock)(UITableView *tableView,NSIndexPath *indexPath);
// 渲染cell数据
typedef void(^YCCellRenderBlock)(UITableViewCell *cell,YCBaseRow *row);
// cell的统一微调
typedef void(^YCCellAdjustBlock)(UITableViewCell *cell);

// cell的响应事件
typedef void(^YCCellDidSelectBlock)(UITableView *tableView,NSIndexPath *indexPath);
typedef void(^YCCellDidDeselectBlock)(UITableView *tableView,NSIndexPath *indexPath);
typedef NSIndexPath*(^YCCellWillSelectBlock)(UITableView *tableView,NSIndexPath *indexPath);
typedef NSIndexPath*(^YCCellWillDeselectBlock)(UITableView *tableView,NSIndexPath *indexPath);
typedef void(^YCCellAccessoryButtonTappedBlock)(UITableView *tableView,NSIndexPath *indexPath);

// 设置头部和尾部
typedef UIView*(^YCViewForHeaderBlock)(UITableView *tableView,NSInteger section);
typedef UIView*(^YCViewForFooterBlock)(UITableView *tableView,NSInteger section);

// cell的显示
typedef void(^YCCellWillDisplayBlock)(UITableView *tableView,UITableViewCell *cell,NSIndexPath *indexPath);
typedef void(^YCHeaderViewWillDisplayBlock)(UITableView *tableView,UIView *view,NSInteger section);
typedef void(^YCFooterViewWillDisplayBlock)(UITableView *tableView,UIView *view,NSInteger section);


// cell的编辑
typedef BOOL(^YCCellCanEditBlock)(UITableView *tableView,NSIndexPath *indexPath);
typedef UITableViewCellEditingStyle(^YCCellEditingStyleBlock)(UITableView *tableView,NSIndexPath *indexPath);
typedef void(^YCCellCommitEditingBlock)(UITableView *tableView,UITableViewCellEditingStyle editingStyle,NSIndexPath *indexPath);
typedef NSString*(^YCDeleteButtonTitleBlock)(UITableView *tableView,NSIndexPath *indexPath);


#define kScreenWidth           
