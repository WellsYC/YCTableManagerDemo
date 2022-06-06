//
//  UITableView+YCTableManager.h
//  Demo
//
//  Created by 蔡亚超 on 2018/12/4.
//  Copyright © 2018年 WellsCai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YCTableManager.h"


@interface UITableView (YCTableManager)
@property(nonatomic,strong)YCTableManager          *tableManager;

- (void)registerNibForDefault:(Class)nibClass;
@end




