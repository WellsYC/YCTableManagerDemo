//
//  YCSystemRow.m
//  Demo
//
//  Created by 蔡亚超 on 2018/12/5.
//  Copyright © 2018年 WellsCai. All rights reserved.
//

#import "YCSystemRow.h"
#import "YCSystemCell.h"

@implementation YCSystemRow
#pragma mark - init
+ (instancetype)rowWithImage:(UIImage *)image title:(NSString *)title detailTitle:(NSString *)detailTitle{
    YCSystemRow *row = [[YCSystemRow alloc] init];
    row.image = image;
    row.title = title;
    row.detailTitle = detailTitle;
    return row;
}

- (void)prepare{
    
    self.isOn = NO;
    self.accessoryType = UITableViewCellAccessoryNone;
    self.contentType = YCSystemContentTypeDefault;
    self.imageWidth = 30.0f;
    self.cellClass = [YCSystemCell class];
}

@end
