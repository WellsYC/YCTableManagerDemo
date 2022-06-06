//
//  ViewController.m
//  Demo
//
//  Created by 蔡亚超 on 2018/5/18.
//  Copyright © 2018年 WellsCai. All rights reserved.
//

#import "ViewController.h"
#import "YCTable.h"

#import "EditDemoViewController.h"
#import "InfoDemoViewController.h"
#import "SectionSetDemoViewController.h"
#import "RowSettingViewController.h"
#import "SearchViewController.h"

#import "CollectionDemoViewController.h"
#import "ScrollowDemoViewController.h"


#import "RedViewController.h"
#import "BlueViewController.h"

@interface ViewController (){
    SectionSetDemoViewController *red;
    CollectionDemoViewController *blue;
}
@property(nonatomic,strong)UITableView          *tableView;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.navigationItem.title = @"YCTable";
    [self.view addSubview:self.tableView];
    [self initTableData];
}

- (void)initTableData{
    YCSystemRow *row1 = [YCSystemRow rowWithImage:nil title:@"删除功能展示" detailTitle:@"用于演示删除的功能"];
    row1.cellDidSelectBlock = ^(UITableView *tableView, NSIndexPath *indexPath) {
        EditDemoViewController *vc = [EditDemoViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    };
    
    YCSystemRow *row2 = [YCSystemRow rowWithImage:nil title:@"section样式展示" detailTitle:@"用于演示section的Header和Footer"];
    row2.cellDidSelectBlock = ^(UITableView *tableView, NSIndexPath *indexPath) {
        SectionSetDemoViewController *vc = [SectionSetDemoViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    };

    YCSystemRow *row3 = [YCSystemRow rowWithImage:nil title:@"row样式展示" detailTitle:@"用于演示row的各种样式"];
    row3.cellDidSelectBlock = ^(UITableView *tableView, NSIndexPath *indexPath) {
        RowSettingViewController *vc = [RowSettingViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    };
    
    
    YCBaseSection *functionSection = [YCBaseSection new];
    functionSection.headerHeight = 30;
    functionSection.headerTitle = @"功能部分";
    functionSection.rows = @[row1,row2,row3];
   
    YCSystemRow *row11 = [YCSystemRow rowWithImage:nil title:@"app设置界面" detailTitle:@"用于自定义app设置界面"];
    row11.cellDidSelectBlock = ^(UITableView *tableView, NSIndexPath *indexPath) {
        InfoDemoViewController *vc = [InfoDemoViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    };
    YCSystemRow *row12 = [YCSystemRow rowWithImage:nil title:@"搜索界面的应该用" detailTitle:@"用于自定义Cell的界面"];
    row12.cellDidSelectBlock = ^(UITableView *tableView, NSIndexPath *indexPath) {
        SearchViewController *vc = [SearchViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    };
    
    YCSystemRow *row13 = [YCSystemRow rowWithImage:nil title:@"collectionView的应用" detailTitle:@"collectionView的封装"];
    row13.cellDidSelectBlock = ^(UITableView *tableView, NSIndexPath *indexPath) {
        CollectionDemoViewController *vc = [CollectionDemoViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    };
    
    YCSystemRow *row14 = [YCSystemRow rowWithImage:nil title:@"scrollowView的应用" detailTitle:@"scrollowView的封装"];
    row14.cellDidSelectBlock = ^(UITableView *tableView, NSIndexPath *indexPath) {
        ScrollowDemoViewController *vc = [ScrollowDemoViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    };
    
    YCSystemRow *row15 = [YCSystemRow rowWithImage:nil title:@"复杂界面的应用" detailTitle:@"复杂界面的应用"];
    row15.cellDidSelectBlock = ^(UITableView *tableView, NSIndexPath *indexPath) {
        
    };
    
    YCBaseSection *exempleSection = [YCBaseSection new];
    exempleSection.headerHeight = 30;
    exempleSection.headerTitle = @"例子部分";
    exempleSection.rows = @[row11,row12,row13,row14,row15];
    
    
    YCTableManager *manager = [[YCTableManager alloc] initWithSections:@[functionSection,exempleSection]];
    manager.allCellStyle = UITableViewCellStyleSubtitle;
    manager.allAccessoryType = UITableViewCellAccessoryDisclosureIndicator;

    manager.cellAdjustBlock = ^(UITableViewCell *cell) {
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
        cell.detailTextLabel.textColor = [UIColor darkGrayColor];
    };
    manager.cellRenderBlock = ^(UITableViewCell *cell, YCBaseRow *row) {
        cell.systemRow = (YCSystemRow *)row;
    };
    self.tableView.tableManager = manager;
}


- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    }
    return _tableView;
}

@end
