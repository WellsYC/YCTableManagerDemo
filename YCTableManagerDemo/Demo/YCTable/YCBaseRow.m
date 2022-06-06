//
//  YCBaseRow.m
//  Demo
//
//  Created by 蔡亚超 on 2018/12/5.
//  Copyright © 2018年 WellsCai. All rights reserved.
//

#import "YCBaseRow.h"

@implementation YCBaseRow
#pragma mark - init
- (instancetype)init{
    if (self = [super init]) {
        self.rowHeight = 44.0f;
        self.initalType = YCCellInitalTypeCode;
        self.cellStyle = UITableViewCellStyleDefault;
        self.shouldHighlight = YES;
        self.cellClass = [UITableViewCell class];
        [self prepare];
    }
    return self;
}

// 子类实现
- (void)prepare{

}

#pragma mark -

@end
