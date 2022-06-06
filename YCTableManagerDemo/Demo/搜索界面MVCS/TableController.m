//
//  TableController.m
//  Demo
//
//  Created by 蔡亚超 on 2018/12/27.
//  Copyright © 2018 WellsCai. All rights reserved.
//

#import "TableController.h"
#import "YCTableDataSource.h"
#import "PersonModel.h"

@implementation TableController




- (void)reloadData:(NSArray *)persons{
    self.tableDataSource.items = persons;
    [self.tableView reloadData];
}

#pragma mark - getting&&setting
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        _tableView.delegate = self.tableDataSource;
        _tableView.dataSource = self.tableDataSource;
    }
    return _tableView;
}

- (YCTableDataSource *)tableDataSource{
    if (_tableDataSource == nil) {
        _tableDataSource = [[YCTableDataSource alloc] initWithItems:@[] configureCellBlock:^(UITableViewCell *cell, id<TableDataProtocol> item) {
            
            PersonModel *model = (PersonModel *)item;
            cell.imageView.image = [UIImage imageNamed:model.imageName];
            cell.textLabel.text = model.name;
            cell.detailTextLabel.text = model.name;
            
        } didSelectCellBlock:^(UITableView *tableView, NSIndexPath *indexPath) {
            
        }];
    }
    return _tableDataSource;
}
@end
