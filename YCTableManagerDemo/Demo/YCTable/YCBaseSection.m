//
//  YCBaseSection.m
//  Demo
//
//  Created by 蔡亚超 on 2018/12/5.
//  Copyright © 2018年 WellsCai. All rights reserved.
//

#import "YCBaseSection.h"

@interface YCBaseSection()
@property(nonatomic,strong)NSMutableArray       *mutableRows;
@end

@implementation YCBaseSection
#pragma mark - init
+ (instancetype)sectionWithRows:(NSArray<YCBaseRow *> *)rows{
    YCBaseSection *section = [[self alloc] init];
    section.rows = rows;
    return section;
}

- (instancetype)init{
    if (self = [super init]) {
        self.isSpread = YES;
        [self prepare];
    }
    return self;
}
// 子类实现
- (void)prepare{
    
}

#pragma mark -
- (void)addRow:(YCBaseRow *)row{
    [self.mutableRows addObject:row];
    [self resetRows];
}
- (void)insertRow:(YCBaseRow *)row atIndex:(NSUInteger)index{
    if (index > self.mutableRows.count - 1) return;
    [self.mutableRows insertObject:row atIndex:index];
    [self resetRows];
}
- (void)removeRowAtIndex:(NSUInteger)index{
    if (index > self.mutableRows.count - 1) return;
    [self.mutableRows removeObjectAtIndex:index];
    [self resetRows];
}
- (void)addRows:(NSArray<YCBaseRow *>*)rows{
    [self.mutableRows addObjectsFromArray:rows];
    [self resetRows];
}

- (void)resetRows{
    self.rows = [NSArray arrayWithArray:self.mutableRows];
}

#pragma mark - Setting&&Getting
- (NSMutableArray *)mutableRows{
    if (!_mutableRows) {
        _mutableRows = [NSMutableArray arrayWithArray:self.rows];
    }
    return _mutableRows;
}
@end
