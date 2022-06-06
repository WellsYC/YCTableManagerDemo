//
//  YCTableManager.m
//  Demo
//
//  Created by 蔡亚超 on 2018/12/5.
//  Copyright © 2018年 WellsCai. All rights reserved.
//

#import "YCTableManager.h"
#import "YCTableExecutor.h"

@interface YCTableManager()
@property(nonatomic,strong)YCTableExecutor                       *tableExecutor;
@property(nonatomic,strong)NSMutableArray                        *mutableSections;
@end

@implementation YCTableManager
#pragma mark - Init
+ (instancetype)managerWithSections:(NSArray<YCBaseSection *> *)sections{
    YCTableManager *manager = [[YCTableManager alloc] initWithSections:sections];
    return manager;
}

- (instancetype)initWithSections:(NSArray<YCBaseSection *> *)sections{
    if (self = [super init]) {
        _sections = sections;
        [self commomInit];
    }
    return self;
}
- (instancetype)init{
    if (self = [super init]) {
        [self commomInit];
    }
    return self;
}

- (void)commomInit{
    _tableExecutor = [[YCTableExecutor alloc] init];
    _fullSeparatorLine = NO;
}


#pragma mark - Section的处理
- (void)resetSections:(NSArray<YCBaseSection *> *)sections{
    [self clearSections];
    self.sections = sections;
    [self.tableView reloadData];
}
- (void)clearSections{
    [self.mutableSections removeAllObjects];
    [self resetSections];
}
- (YCBaseSection *)sectionAtIndex:(NSUInteger)index{
    if (index > self.mutableSections.count - 1) return nil;
    return self.mutableSections[index];
}
- (void)addSection:(YCBaseSection *)section{
    [self.mutableSections addObject:section];
    [self resetSections];
}
- (void)addSections:(NSArray<YCBaseSection *>*)sections{
    [self.mutableSections addObjectsFromArray:sections];
    [self resetSections];
}
- (void)insertSection:(YCBaseSection *)section atIndex:(NSUInteger)index{
    if (index > self.mutableSections.count - 1) return;
    [self.mutableSections insertObject:section atIndex:index];
    [self resetSections];
}
- (void)removeSectionAtIndex:(NSUInteger)index{
    if (index > self.mutableSections.count - 1) return;
    [self.mutableSections removeObjectAtIndex:index];
    [self resetSections];
    [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:self.mutableSections.count - 1] withRowAnimation:UITableViewRowAnimationFade];
}
- (void)resetSections{
    self.sections = [NSArray arrayWithArray:self.mutableSections];
}
#pragma mark - Row的处理
- (void)insertRow:(YCBaseRow *)row atIndexPath:(NSIndexPath *)indexPath{
    YCBaseSection *baseSection = self.sections[indexPath.section];
    [baseSection insertRow:row atIndex:indexPath.row];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}
- (void)removeRowAtIndexPath:(NSIndexPath *)indexPath{
    YCBaseSection *baseSection = self.sections[indexPath.section];
    [baseSection removeRowAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}
- (void)addRows:(NSArray<YCBaseRow *>*)rows{
    if (self.sections.count <= 0) {
        YCBaseSection *section = [YCBaseSection sectionWithRows:rows];
        self.sections = @[section];
    }else{
        YCBaseSection *section = self.sections.lastObject;
        [section addRows:rows];
    }
}

#pragma mark -
- (YCBaseRow *)rowAtIndex:(NSIndexPath *)indexPath{
    YCBaseSection *section = [self sectionAtIndex:indexPath.section];
    if (indexPath.row > section.rows.count - 1) return nil;
    return section.rows[indexPath.row];
}
#pragma mark - Setting&&Getting
- (void)setTableView:(UITableView *)tableView{
    _tableView = tableView;
    _tableExecutor.tableManager = self;
}
- (NSMutableArray *)mutableSections{
    if (!_mutableSections) {
        _mutableSections = [NSMutableArray arrayWithArray:self.sections];
    }
    return _mutableSections;
}

#pragma mark - Cell样式的统一设置
- (void)setAllCellStyle:(UITableViewCellStyle)allCellStyle{
    _allCellStyle = allCellStyle;
    [self.sections enumerateObjectsUsingBlock:^(YCBaseSection * _Nonnull section, NSUInteger idx, BOOL * _Nonnull stop) {
        [section.rows enumerateObjectsUsingBlock:^(YCBaseRow * _Nonnull row, NSUInteger idx, BOOL * _Nonnull stop) {
            row.cellStyle = allCellStyle;
        }];
    }];
}

- (void)setAllAccessoryType:(UITableViewCellAccessoryType)allAccessoryType{
    _allAccessoryType = allAccessoryType;
    [self.sections enumerateObjectsUsingBlock:^(YCBaseSection * _Nonnull section, NSUInteger idx, BOOL * _Nonnull stop) {
        [section.rows enumerateObjectsUsingBlock:^(YCBaseRow * _Nonnull row, NSUInteger idx, BOOL * _Nonnull stop) {
            row.accessoryType = allAccessoryType;
        }];
    }];
}
- (void)setAllCellClass:(Class)allCellClass{
    _allCellClass = allCellClass;
    [self.sections enumerateObjectsUsingBlock:^(YCBaseSection * _Nonnull section, NSUInteger idx, BOOL * _Nonnull stop) {
        [section.rows enumerateObjectsUsingBlock:^(YCBaseRow * _Nonnull row, NSUInteger idx, BOOL * _Nonnull stop) {
            row.cellClass = allCellClass;
        }];
    }];
}
@end
