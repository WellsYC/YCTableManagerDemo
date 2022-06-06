//
//  UITableViewCell+YCAdd.h
//  Demo
//
//  Created by 蔡亚超 on 2018/12/14.
//  Copyright © 2018年 WellsCai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YCSystemRow.h"

@interface UITableViewCell (YCAdd)
@property(nonatomic,strong)YCSystemRow      *systemRow;
@property(nonatomic,strong)NSIndexPath      *currentIndexPath;

+ (instancetype)cellForTableView:(UITableView *)tableView cellStyle:(UITableViewCellStyle)style adjustBlock:(YCCellAdjustBlock)adjustBlock;

+ (instancetype)xibCellForTableView:(UITableView *)tableView adjustBlock:(YCCellAdjustBlock)adjustBlock;
@end

