//
//  InfoDemoViewController.m
//  Demo
//
//  Created by 蔡亚超 on 2018/12/16.
//  Copyright © 2018 WellsCai. All rights reserved.
//

#import "InfoDemoViewController.h"
#import "YCTable.h"
#import "SettingDemoViewController.h"

@interface InfoDemoViewController ()

@end

@implementation InfoDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupTableManager];
}

- (void)setupTableManager{
    YCSystemRow *row1 = [YCSystemRow new];
    row1.title = @"头像";
    row1.contentType = YCSystemContentTypeImage;
    row1.contentImage = [UIImage imageNamed:@"icon"];
    row1.rowHeight = 60;
    row1.imageWidth = 48;
    row1.shouldHighlight = NO;
    
    YCSystemRow *row2 = [YCSystemRow new];
    row2.title = @"名字";
    row2.detailTitle = @"朱宏宇";
    
    YCSystemRow *row3 = [YCSystemRow new];
    row3.title = @"微信号";
    row3.detailTitle = @"15250293030";
    
    YCSystemRow *row4 = [YCSystemRow new];
    row4.title = @"我的地址";
    
    YCBaseSection *section1 = [YCBaseSection sectionWithRows:@[row1,row2,row3,row4]];
    section1.headerHeight = 10;
    
    YCSystemRow *row11 = [YCSystemRow new];
    row11.title = @"性别";
    row11.detailTitle = @"男";
    
    YCSystemRow *row12 = [YCSystemRow new];
    row12.title = @"地区";
    row12.detailTitle = @"福建 厦门";
    
    YCSystemRow *row13 = [YCSystemRow new];
    row13.title = @"个性签名";
    row13.detailTitle = @"新的一天，加油";
    
    YCBaseSection *section2 = [YCBaseSection sectionWithRows:@[row11,row12,row13]];
    section2.headerHeight = 30;
    
    YCSystemRow *row21 = [YCSystemRow new];
    row21.title = @"设置";
    row21.cellRenderBlock = ^(UITableViewCell *cell, YCBaseRow *row) {
        cell.textLabel.textAlignment = NSTextAlignmentCenter;//文字居中
    };
    row21.cellDidSelectBlock = ^(UITableView *tableView, NSIndexPath *indexPath) {
        SettingDemoViewController *vc = [SettingDemoViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    };
    
    YCBaseSection *section3 = [YCBaseSection sectionWithRows:@[row21]];
    section3.headerHeight = 30;
    
    YCTableManager *manager = [[YCTableManager alloc] initWithSections:@[section1,section2,section3]];
    manager.allCellStyle = UITableViewCellStyleValue1;
    manager.allAccessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    row21.accessoryType = UITableViewCellAccessoryNone;
    row21.cellStyle = UITableViewCellStyleDefault;
    
    manager.cellAdjustBlock = ^(UITableViewCell *cell) {
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:13];
        cell.detailTextLabel.textColor = [UIColor grayColor];
    };
    
    self.tableView.tableManager = manager;
    self.tableView.tableFooterView = [UIView new];
}

@end
