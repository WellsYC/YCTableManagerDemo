//
//  YCTableDataSource.m
//  Demo
//
//  Created by 蔡亚超 on 2018/12/22.
//  Copyright © 2018 WellsCai. All rights reserved.
//

#import "YCTableDataSource.h"

@interface YCTableDataSource()
@property(nonatomic,copy)ConfigureCellBlock                 configureBlock;
@property(nonatomic,copy)DidSelectCellBlock                 didSelectBlock;

@end

@implementation YCTableDataSource

- (instancetype)initWithItems:(NSArray<TableDataProtocol> *)items configureCellBlock:(ConfigureCellBlock)configureBlock didSelectCellBlock:(DidSelectCellBlock)didSelectBlock{
    if (self = [super init]) {
        _items = items;
        _configureBlock = configureBlock;
        _didSelectBlock = didSelectBlock;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.items.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    id<TableDataProtocol> item = self.items[indexPath.row];
    NSString *className = item.cellClass?NSStringFromClass(item.cellClass):NSStringFromClass([UITableViewCell class]);
    
    id cell = [tableView dequeueReusableCellWithIdentifier:className];
    if (cell == nil) {
        cell = [[item.cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:className];
    }
    if (self.configureBlock) {
        self.configureBlock(cell, item);
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.didSelectBlock) {
        self.didSelectBlock(tableView, indexPath);
    }
}

@end
