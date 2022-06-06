//
//  UITableViewCell+YCAdd.m
//  Demo
//
//  Created by 蔡亚超 on 2018/12/14.
//  Copyright © 2018年 WellsCai. All rights reserved.
//

#import "UITableViewCell+YCAdd.h"
#import "UITableView+YCTableManager.h"
#import <objc/runtime.h>


@implementation UITableViewCell (YCAdd)

@dynamic currentIndexPath;
@dynamic systemRow;

- (NSIndexPath *)currentIndexPath {
    NSIndexPath *indexPath = objc_getAssociatedObject(self, @selector(currentIndexPath));
    return indexPath;
}
- (void)setCurrentIndexPath:(NSIndexPath *)currentIndexPath {
    objc_setAssociatedObject(self, @selector(currentIndexPath), currentIndexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (YCSystemRow *)systemRow{
    return objc_getAssociatedObject(self, @selector(systemRow));
}
- (void)setSystemRow:(YCSystemRow *)systemRow{
    objc_setAssociatedObject(self, @selector(systemRow), systemRow, OBJC_ASSOCIATION_RETAIN);
    // init
    self.imageView.image = systemRow.image;
    self.textLabel.text = systemRow.title;
    self.detailTextLabel.text = systemRow.detailTitle;
    self.accessoryType = systemRow.accessoryType;
    self.accessoryView = systemRow.accessoryView;
}



+ (instancetype)cellForTableView:(UITableView *)tableView cellStyle:(UITableViewCellStyle)style adjustBlock:(YCCellAdjustBlock)adjustBlock{
    UITableViewCellStyle cellStytle = style>=0?style:UITableViewCellStyleDefault;
    NSString *cellID = NSStringFromClass([self class]);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:cellStytle reuseIdentifier:cellID];
        if (adjustBlock) {
            adjustBlock(cell);
        }
    }
    return cell;
}

+ (instancetype)xibCellForTableView:(UITableView *)tableView adjustBlock:(YCCellAdjustBlock)adjustBlock{
    NSString *cellID = NSStringFromClass([self class]);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        [tableView registerNibForDefault:[self class]];
        cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (adjustBlock) {
            adjustBlock(cell);
        }
    }
    return cell;
}


@end
