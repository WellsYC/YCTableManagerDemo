//
//  SettingDemoViewController.m
//  Demo
//
//  Created by 蔡亚超 on 2018/12/13.
//  Copyright © 2018年 WellsCai. All rights reserved.
//

#import "SettingDemoViewController.h"
#import "YCTable.h"


@interface SettingDemoViewController ()
@property(nonatomic,strong)NSDictionary     *dicInfo;
@end

@implementation SettingDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupTableManager];
}
- (void)setupTableManager{
    YCSystemRow *row1 = [YCSystemRow new];
    row1.title = @"可直接向我发起语音聊天";
    row1.contentType = YCSystemContentTypeSwitch;
    
    YCSystemRow *row2 = [YCSystemRow new];
    row2.title = @"允许查看我的资料";
    row2.contentType = YCSystemContentTypeSwitch;

    
    YCSystemRow *row3 = [YCSystemRow new];
    row3.title = @"允许关注我";
    row3.contentType = YCSystemContentTypeSwitch;
    
    YCBaseSection *section1 = [YCBaseSection sectionWithRows:@[row1,row2,row3]];
    section1.headerHeight = 40;
    section1.headerTitle = @"我的好友权限";
    section1.footerHeight = 50;
    section1.footerTitle = @"开启后，您的好友就有拥有对应的权限，请谨慎选择！";
    
    
    YCSystemRow *row11 = [YCSystemRow new];
    row11.title = @"一键接听语音电话";
    row11.contentType = YCSystemContentTypeSwitch;
    
    YCBaseSection *section2 = [YCBaseSection sectionWithRows:@[row11]];
    section2.headerHeight = 44;
    section2.headerTitle = @"接听方式";
    section2.footerHeight = 50;
    section2.footerTitle = @"开启后，无需打开APP，即可像系统电话一样接听";
    
    YCTableManager *manager = [[YCTableManager alloc] initWithSections:@[section1,section2]];
    
    manager.cellAdjustBlock = ^(UITableViewCell *cell) {
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:13];
        cell.detailTextLabel.textColor = [UIColor grayColor];
    };
    
    self.tableView.tableManager = manager;
    self.tableView.tableFooterView = [UIView new];
}

@end
