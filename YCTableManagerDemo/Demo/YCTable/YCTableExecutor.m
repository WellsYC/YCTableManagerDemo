//
//  YCTableExecutor.m
//  Demo
//
//  Created by 蔡亚超 on 2018/12/5.
//  Copyright © 2018年 WellsCai. All rights reserved.
//

#import "YCTableExecutor.h"
#import "YCTableManager.h"
#import "UITableViewCell+YCAdd.h"

@interface YCTableExecutor()<UITableViewDelegate,UITableViewDataSource>
@end

@implementation YCTableExecutor
#pragma mark - <UITableViewDelegate,UITableViewDataSource>
#pragma mark Commom 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.tableManager.sections.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.tableManager.sections[section].isSpread) {
        return self.tableManager.sections[section].rows.count;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.rowHeight > 0) return tableView.rowHeight;
    return [self.tableManager rowAtIndex:indexPath].rowHeight;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1.Row自己处理
    YCBaseRow *row = [self.tableManager rowAtIndex:indexPath];
    if (row.cellForRowBlock){
        return row.cellForRowBlock(tableView,indexPath);
    }
    // 2.tableManager统一处理
    if (self.tableManager.cellForRowBlock){
        return self.tableManager.cellForRowBlock(tableView,indexPath);
    }

    // 3.默认实现(cellAdjustBlock是样式的微调)
    UITableViewCell *cell = nil;
    if (row.initalType == YCCellInitalTypeCode) {
        cell = [row.cellClass cellForTableView:tableView cellStyle:row.cellStyle adjustBlock:self.tableManager.cellAdjustBlock];
    }else{
        cell = [row.cellClass xibCellForTableView:tableView adjustBlock:self.tableManager.cellAdjustBlock];
    }
    cell.currentIndexPath = indexPath;
    // cell的渲染回调
    if (row.cellRenderBlock) {
        row.cellRenderBlock(cell, row);
    }
    if (self.tableManager.cellRenderBlock) {
        self.tableManager.cellRenderBlock(cell,row);
    }
    // 如果是系统样式，直接设置
    if ([row isMemberOfClass:[YCSystemRow class]]) {
        cell.systemRow = (YCSystemRow *)row;
    }
    return cell;
}
#pragma mark Show&&Dismiss
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.tableManager.fullSeparatorLine) {
        // 设置分隔符
        if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
            [cell setSeparatorInset:UIEdgeInsetsZero];
        }
        if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
            [cell setLayoutMargins:UIEdgeInsetsZero];
        }
    }
    
    YCBaseRow *row = [self.tableManager rowAtIndex:indexPath];
    if (row.cellWillDisplayBlock) {
        row.cellWillDisplayBlock(tableView,cell,indexPath);
    }
    if (self.tableManager.cellWillDisplayBlock) {
        self.tableManager.cellWillDisplayBlock(tableView, cell, indexPath);
    }
}
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    YCBaseSection *baseSection = [self.tableManager.sections objectAtIndex:section];
    if (baseSection.headerViewWillDisplayBlock) {
        baseSection.headerViewWillDisplayBlock(tableView,view,section);
    }
}
- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section{
    YCBaseSection *baseSection = [self.tableManager.sections objectAtIndex:section];
    if (baseSection.footerViewWillDisplayBlock) {
        baseSection.footerViewWillDisplayBlock(tableView,view,section);
    }
}
#pragma mark Header
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.tableManager.sections[section].headerTitle;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    YCBaseSection *baseSection = self.tableManager.sections[section];
    // 先让section自己处理
    if (baseSection.viewForHeaderBlock) {
        return baseSection.viewForHeaderBlock(tableView,section);
    }
    // 再让tableManager处理
    if (self.tableManager.viewForHeaderBlock) {
        return self.tableManager.viewForHeaderBlock(tableView,section);
    }
    return baseSection.headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    YCBaseSection *baseSection = self.tableManager.sections[section];
    if (baseSection.headerHeight > 0) {
        return self.tableManager.sections[section].headerHeight;
    }
    return CGFLOAT_MIN;
}
#pragma mark Footer
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return self.tableManager.sections[section].footerTitle;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    YCBaseSection *baseSection = self.tableManager.sections[section];
    // 先让section自己处理
    if (baseSection.viewForFooterBlock) {
        return baseSection.viewForFooterBlock(tableView,section);
    }
    // 再让tableManager处理
    if (self.tableManager.viewForFooterBlock) {
        return self.tableManager.viewForFooterBlock(tableView,section);
    }
    return baseSection.footerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    YCBaseSection *baseSection = self.tableManager.sections[section];
    if (baseSection.headerHeight > 0) {
        return self.tableManager.sections[section].footerHeight;
    }
    return CGFLOAT_MIN;
}

#pragma mark Action
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // Row自己处理
    YCBaseRow *row = [self.tableManager rowAtIndex:indexPath];
    if (row.cellDidSelectBlock) {
        row.cellDidSelectBlock(tableView,indexPath);
    }
    // tableManager统一处理
    if (self.tableManager.cellDidSelectBlock) {
        self.tableManager.cellDidSelectBlock(tableView,indexPath);
    }
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    YCBaseRow *row = [self.tableManager rowAtIndex:indexPath];
    if (row.cellDidDeselectBlock) {
        row.cellDidDeselectBlock(tableView,indexPath);
    }
    if (self.tableManager.cellDidDeselectBlock) {
        self.tableManager.cellDidDeselectBlock(tableView,indexPath);
    }
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    YCBaseRow *row = [self.tableManager rowAtIndex:indexPath];
    if (row.cellWillSelectBlock) {
        return row.cellWillSelectBlock(tableView,indexPath);
    }
    if (self.tableManager.cellWillSelectBlock) {
        return self.tableManager.cellWillSelectBlock(tableView,indexPath);
    }
    return indexPath;
}
- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    YCBaseRow *row = [self.tableManager rowAtIndex:indexPath];
    if (row.cellWillDeselectBlock) {
        return row.cellWillDeselectBlock(tableView,indexPath);
    }
    if (self.tableManager.cellWillDeselectBlock) {
        return self.tableManager.cellWillDeselectBlock(tableView,indexPath);
    }
    return indexPath;
}
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.tableManager rowAtIndex:indexPath].shouldHighlight;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(nonnull NSIndexPath *)indexPath{
    // Row自己处理
    YCBaseRow *row = [self.tableManager rowAtIndex:indexPath];
    if (row.accessoryButtonTappedBlock) {
        row.accessoryButtonTappedBlock(tableView,indexPath);
    }
    // tableManager统一处理
    if (self.tableManager.accessoryButtonTappedBlock) {
        self.tableManager.accessoryButtonTappedBlock(tableView,indexPath);
    }
}
#pragma mark Edit
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.tableManager.deleteStytle) {
        return YES;
    }
    if (self.tableManager.cellCanEditBlock) {
        return self.tableManager.cellCanEditBlock(tableView,indexPath);
    }
    return NO;
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.tableManager.deleteStytle) {
        return UITableViewCellEditingStyleDelete;
    }
    if (self.tableManager.cellEditingStyleBlock) {
        return self.tableManager.cellEditingStyleBlock(tableView,indexPath);
    }
    return UITableViewCellEditingStyleNone;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.tableManager.cellCommitEditingBlock) {
        self.tableManager.cellCommitEditingBlock(tableView,editingStyle,indexPath);
    }
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.tableManager.allDeleteButtonTitle) {
        return self.tableManager.allDeleteButtonTitle;
    }
    NSString *deleteButtonTitle = [self.tableManager rowAtIndex:indexPath].deleteButtonTitle;
    if (deleteButtonTitle) {
        return deleteButtonTitle;
    }
    if (self.tableManager.deleteButtonTitleBlock) {
        self.tableManager.deleteButtonTitleBlock(tableView,indexPath);
    }
    return @"Delete";
}
#pragma mark - UIScrollViewDelegate


#pragma mark - Setting&&Getting
- (void)setTableManager:(YCTableManager *)tableManager{
    _tableManager = tableManager;
    
    _tableManager.tableView.delegate = self;
    _tableManager.tableView.dataSource = self;
}
@end
