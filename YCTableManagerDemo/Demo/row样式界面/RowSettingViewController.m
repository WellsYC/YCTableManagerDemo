//
//  RowSettingViewController.m
//  Demo
//
//  Created by 蔡亚超 on 2018/12/16.
//  Copyright © 2018 WellsCai. All rights reserved.
//

#import "RowSettingViewController.h"
#import "ChatRow.h"
#import "YCTable.h"
#import "MJExtension.h"
#import "ChatCell.h"
#import "ChatModel.h"
#import "ChatTableViewCell.h"


@interface RowSettingViewController ()
@end

@implementation RowSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"加载中...";

    [self getData];
}

#pragma mark -
- (void)getData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSArray *arr1 = [ChatModel mj_objectArrayWithKeyValuesArray:[self getDataArr]];
        YCBaseSection *section1 = [YCBaseSection new];
        section1.headerTitle = @"code创建";
        section1.headerHeight = 40;
        for (ChatModel *model in arr1) {
            ChatRow *row = [ChatRow new];
            row.cellClass = [ChatCell class];
            row.chatModel = model;
            [section1 addRow:row];
        }
        
        NSArray *arr2 = [ChatModel mj_objectArrayWithKeyValuesArray:[self getXibDataArr]];
        YCBaseSection *section2 = [YCBaseSection new];
        section2.headerTitle = @"xib创建";
        section2.headerHeight = 40;
        for (ChatModel *model in arr2) {
            ChatRow *row = [ChatRow new];
            row.cellClass = [ChatTableViewCell class];
            row.initalType = YCCellInitalTypeXib;
            row.chatModel = model;
            [section2 addRow:row];
        }
        
        YCTableManager *manager = [YCTableManager managerWithSections:@[section1,section2]];
        
        manager.cellRenderBlock = ^(UITableViewCell *cell, YCBaseRow *row) {
            ChatCell *chatCell = (ChatCell *)cell;
            chatCell.chatRow = (ChatRow *)row;
        };
        
        
        self.tableView.rowHeight = 60;
        self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0.01)];;

        self.tableView.tableManager = manager;
        self.navigationItem.title = @"加载完成";

    });
}
- (void)setupYCTable:(NSArray *)arr{
    YCTableManager *manager = [YCTableManager new];
    [manager addRows:arr];
    
    manager.cellRenderBlock = ^(UITableViewCell *cell, YCBaseRow *row) {
        ChatCell *chatCell = (ChatCell *)cell;
        chatCell.chatRow = (ChatRow *)row;
    };
    
    self.tableView.tableManager = manager;
    self.tableView.rowHeight = 60;
    self.tableView.estimatedSectionHeaderHeight = CGFLOAT_MIN;
    self.tableView.estimatedSectionFooterHeight = CGFLOAT_MIN;
}


- (NSArray *)getDataArr{
    NSArray *arrData =@[
                        @{
                            @"name":@"王帅",
                            @"content":@"你好！",
                            @"headIcon":@"icon",
                            },
                        @{
                            @"name":@"张新华",
                            @"content":@"你在哪里啊？火车站？",
                            @"headIcon":@"icon",
                            },
                        @{
                            @"name":@"任银豪",
                            @"content":@"好的，我马上到。",
                            @"headIcon":@"icon",
                            }
                        ];
    return arrData;
}
- (NSArray *)getXibDataArr{
    NSArray *arrData =@[
                        @{
                            @"name":@"王帅",
                            @"content":@"你好！",
                            @"headIcon":@"icon",
                            },
                        @{
                            @"name":@"张新华",
                            @"content":@"你在哪里啊？火车站？",
                            @"headIcon":@"icon",
                            },
                        @{
                            @"name":@"任银豪",
                            @"content":@"好的，我马上到。",
                            @"headIcon":@"icon",
                            }
                        ];
    return arrData;
}

@end
