//
//  EditDemoViewController.m
//  Demo
//
//  Created by 蔡亚超 on 2018/12/13.
//  Copyright © 2018年 WellsCai. All rights reserved.
//

#import "EditDemoViewController.h"
#import "YCTable.h"

@interface EditDemoViewController ()

@end

@implementation EditDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"删除功能";
    [self setupTableManager];
}

- (void)setupTableManager{
    YCBaseSection *section = [YCBaseSection new];
    
    for (int i = 0; i < 8; i ++) {
        YCSystemRow *row = [YCSystemRow rowWithImage:[UIImage imageNamed:@"icon"] title:[NSString stringWithFormat:@"标题%d",i] detailTitle:@"详细内容"];
        row.cellStyle = UITableViewCellStyleValue1;
        [section addRow:row];
    }
    
    YCTableManager *manager = [YCTableManager new];
    [manager addSection:section];
    manager.deleteStytle = YES;
    self.tableView.tableManager = manager;
    self.tableView.tableManager.allDeleteButtonTitle = @"删除";
    self.tableView.tableManager.cellCommitEditingBlock = ^(UITableView *tableView, UITableViewCellEditingStyle editingStyle, NSIndexPath *indexPath) {
        [tableView.tableManager removeRowAtIndexPath:indexPath];
    };
}

@end
