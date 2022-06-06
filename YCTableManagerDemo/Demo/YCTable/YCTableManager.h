//
//  YCTableManager.h
//  Demo
//
//  Created by 蔡亚超 on 2018/12/5.
//  Copyright © 2018年 WellsCai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YCBaseSection.h"
#import "YCAssist.h"

@class YCTableExecutor;

@interface YCTableManager : NSObject
@property(nonatomic,strong)NSArray<YCBaseSection *>              *sections;
@property(nonatomic,  weak)UITableView                           *tableView;
// 设置分割线顶格
@property(nonatomic,assign)BOOL                                  fullSeparatorLine;
// 删除状态
@property(nonatomic,assign)BOOL                                  deleteStytle;


// cell的同一样式
@property(nonatomic,assign)UITableViewCellStyle                  allCellStyle;
@property(nonatomic,assign)UITableViewCellAccessoryType          allAccessoryType;
@property(nonatomic,assign)Class                                 allCellClass;
@property(nonatomic,  copy)NSString                             *allDeleteButtonTitle;

/*    通用的Block,统一处理     */
// 整个设置cell的方法
@property(nonatomic,  copy)YCCellForRowBlock                    cellForRowBlock;
// 1）cell微调(用于统一设置UItableViewCell的样式)
@property(nonatomic,  copy)YCCellAdjustBlock                    cellAdjustBlock;
// 2）cell设置数据(用于渲染Cell的数据样式)
@property(nonatomic,  copy)YCCellRenderBlock                    cellRenderBlock;

// cell的点击事件
@property(nonatomic,  copy)YCCellDidSelectBlock                 cellDidSelectBlock;
@property(nonatomic,  copy)YCCellDidDeselectBlock               cellDidDeselectBlock;
@property(nonatomic,  copy)YCCellWillSelectBlock                cellWillSelectBlock;
@property(nonatomic,  copy)YCCellWillDeselectBlock              cellWillDeselectBlock;
@property(nonatomic,  copy)YCCellAccessoryButtonTappedBlock     accessoryButtonTappedBlock;

// 设置Header和Footer
@property(nonatomic, copy)YCViewForHeaderBlock                  viewForHeaderBlock;
@property(nonatomic, copy)YCViewForFooterBlock                  viewForFooterBlock;

// 显示
@property(nonatomic, copy)YCCellWillDisplayBlock                cellWillDisplayBlock;

// 编辑
@property(nonatomic, copy)YCCellCanEditBlock                    cellCanEditBlock;
@property(nonatomic, copy)YCCellEditingStyleBlock               cellEditingStyleBlock;
@property(nonatomic, copy)YCCellCommitEditingBlock              cellCommitEditingBlock;
@property(nonatomic, copy)YCDeleteButtonTitleBlock              deleteButtonTitleBlock;

// init
+ (instancetype)managerWithSections:(NSArray<YCBaseSection *> *)sections;
- (instancetype)initWithSections:(NSArray<YCBaseSection *> *)sections;



- (YCBaseRow *)rowAtIndex:(NSIndexPath *)indexPath;

- (void)resetSections:(NSArray<YCBaseSection *> *)sections;
- (void)clearSections;
// 对section的处理
- (YCBaseSection *)sectionAtIndex:(NSUInteger)index;
- (void)addSection:(YCBaseSection *)section;
- (void)addSections:(NSArray<YCBaseSection *>*)sections;
- (void)insertSection:(YCBaseSection *)section atIndex:(NSUInteger)index;
- (void)removeSectionAtIndex:(NSUInteger)index;
// 对row的处理
- (void)insertRow:(YCBaseRow *)row atIndexPath:(NSIndexPath *)indexPath;
- (void)removeRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)addRows:(NSArray<YCBaseRow *>*)rows;
@end
