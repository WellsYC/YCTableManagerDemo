//
//  YCBaseSection.h
//  Demo
//
//  Created by 蔡亚超 on 2018/12/5.
//  Copyright © 2018年 WellsCai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YCBaseRow.h"

@interface YCBaseSection : NSObject
@property(nonatomic,strong)NSArray<YCBaseRow *>              *rows;

@property(nonatomic,  copy)NSString                          *headerTitle;
@property(nonatomic,  copy)NSString                          *footerTitle;
@property(nonatomic,strong)UIView                            *headerView;
@property(nonatomic,strong)UIView                            *footerView;

@property(nonatomic,assign)CGFloat                            headerHeight;
@property(nonatomic,assign)CGFloat                            footerHeight;
// 是否展开（default == YES）
@property(nonatomic,assign)BOOL                               isSpread;

// 设置Header和Footer
@property(nonatomic, copy)YCViewForHeaderBlock                viewForHeaderBlock;
@property(nonatomic, copy)YCViewForFooterBlock                viewForFooterBlock;

@property(nonatomic, copy)YCHeaderViewWillDisplayBlock        headerViewWillDisplayBlock;
@property(nonatomic, copy)YCFooterViewWillDisplayBlock        footerViewWillDisplayBlock;


+ (instancetype)sectionWithRows:(NSArray<YCBaseRow *> *)rows;

- (void)addRow:(YCBaseRow *)row;
- (void)insertRow:(YCBaseRow *)row atIndex:(NSUInteger)index;
- (void)removeRowAtIndex:(NSUInteger)index;
- (void)addRows:(NSArray<YCBaseRow *>*)rows;

// 子类实现
- (void)prepare;

@end
