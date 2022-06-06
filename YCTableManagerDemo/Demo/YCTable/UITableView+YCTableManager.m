//
//  UITableView+YCTableManager.m
//  Demo
//
//  Created by 蔡亚超 on 2018/12/4.
//  Copyright © 2018年 WellsCai. All rights reserved.
//

#import "UITableView+YCTableManager.h"
#import <objc/runtime.h>

static const char ycTableManager;

@implementation UITableView (YCTableManager)
- (YCTableManager *)tableManager{
    return objc_getAssociatedObject(self, &ycTableManager);
}
- (void)setTableManager:(YCTableManager *)tableManager{
    objc_setAssociatedObject(self, &ycTableManager, tableManager, OBJC_ASSOCIATION_RETAIN);
    
    tableManager.tableView = self;
}

- (void)registerNibForDefault:(Class)nibClass{
    UINib *nib = [UINib nibWithNibName:NSStringFromClass(nibClass) bundle:nil];
    NSString *reuseIdentifier = NSStringFromClass(nibClass);
    [self registerNib:nib forCellReuseIdentifier:reuseIdentifier];
}
@end


