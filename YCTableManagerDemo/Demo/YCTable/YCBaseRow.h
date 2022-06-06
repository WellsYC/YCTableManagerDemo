//
//  YCBaseRow.h
//  Demo
//
//  Created by 蔡亚超 on 2018/12/5.
//  Copyright © 2018年 WellsCai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YCAssist.h"

typedef NS_ENUM(NSInteger,YCCellInitalType){
    YCCellInitalTypeCode = 0,
    YCCellInitalTypeXib,
};

@interface YCBaseRow : NSObject

@property(nonatomic,assign)CGFloat                             rowHeight;
@property(nonatomic,assign)YCCellInitalType                    initalType;
@property(nonatomic,assign)Class                               cellClass;
@property(nonatomic,assign)UITableViewCellStyle                cellStyle;
@property(nonatomic,assign)UITableViewCellAccessoryType        accessoryType;
@property(nonatomic,  copy)NSString                           *deleteButtonTitle;
@property(nonatomic,assign)BOOL                                shouldHighlight;

/// 设置cell(不处理就会统一交给tableManager处理)
@property(nonatomic,  copy)YCCellForRowBlock                    cellForRowBlock;
@property(nonatomic,  copy)YCCellRenderBlock                    cellRenderBlock;
@property(nonatomic,  copy)YCCellWillDisplayBlock               cellWillDisplayBlock;


@property(nonatomic,  copy)YCCellDidSelectBlock                 cellDidSelectBlock;
@property(nonatomic,  copy)YCCellDidDeselectBlock               cellDidDeselectBlock;
@property(nonatomic,  copy)YCCellWillSelectBlock                cellWillSelectBlock;
@property(nonatomic,  copy)YCCellWillDeselectBlock              cellWillDeselectBlock;
@property(nonatomic,  copy)YCCellAccessoryButtonTappedBlock     accessoryButtonTappedBlock;

// 子类实现
- (void)prepare;
@end
