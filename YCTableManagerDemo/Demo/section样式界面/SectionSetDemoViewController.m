//
//  SectionSetDemoViewController.m
//  Demo
//
//  Created by 蔡亚超 on 2018/12/13.
//  Copyright © 2018年 WellsCai. All rights reserved.
//

#import "SectionSetDemoViewController.h"
#import "MJExtension.h"
#import "DoctorTeamSection.h"
#import "DoctorRow.h"
#import "YCTable.h"
#import "DoctorTeamHeaderView.h"

@interface SectionSetDemoViewController ()

@end

@implementation SectionSetDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"加载中...";
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 0.01)];;
    [self getData];
    
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    self.tableView.frame = self.view.bounds;
}

- (void)getData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSArray *arr = [DoctorTeamSection mj_objectArrayWithKeyValuesArray:[self getDataArr]];
        
        YCTableManager *manager = [YCTableManager managerWithSections:arr];
        manager.cellRenderBlock = ^(UITableViewCell *cell, YCBaseRow *row) {
            DoctorRow *drRow = (DoctorRow *)row;
            cell.textLabel.text = drRow.name;
            cell.imageView.image = [UIImage imageNamed:drRow.headImage];
        };
        manager.viewForHeaderBlock = ^UIView *(UITableView *tableView, NSInteger section) {
            DoctorTeamHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"head"];
            if (view == nil) {
                view = [[DoctorTeamHeaderView alloc] initWithReuseIdentifier:@"head"];
            }
            view.teamSection = (DoctorTeamSection *)tableView.tableManager.sections[section];
            view.buttonClickHandle = ^(BOOL isSpread) {
//                [self.tableView beginUpdates];

//                [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationNone];
                
                [self.tableView reloadData];

//                [self.tableView endUpdates];

            };
            return view;
        };
        
        self.tableView.rowHeight = 44;
        self.tableView.tableManager = manager;
        
        
        self.navigationItem.title = @"加载完成";

    });
}

#pragma mark -
- (NSArray *)getDataArr{
    NSArray *arrData =@[
                        @{
                            @"name":@"第一医院团队",
                            @"signCount":@"233",
                            @"headIcon":@"icon",
                            @"drList":@[
                                    @{
                                        @"name":@"王浩",
                                        @"headImage":@"icon",
                                        },
                                    @{
                                        @"name":@"郭未",
                                        @"headImage":@"icon",
                                        },
                                    @{
                                        @"name":@"郑时",
                                        @"headImage":@"icon",
                                        },
                                    @{
                                        @"name":@"王世明",
                                        @"headImage":@"icon",
                                        },
                                    ],
                            },
                        @{
                            @"name":@"第二医院团队",
                            @"signCount":@"23",
                            @"headIcon":@"icon",
                            @"drList":@[
                                    @{
                                        @"name":@"张飒",
                                        @"headImage":@"icon",
                                        },
                                    @{
                                        @"name":@"郭美美",
                                        @"headImage":@"icon",
                                        },
                                    @{
                                        @"name":@"李想",
                                        @"headImage":@"icon",
                                        },
                                    @{
                                        @"name":@"张小明",
                                        @"headImage":@"icon",
                                        },
                                    ],
                            },
                        @{
                            @"name":@"第三医院团队",
                            @"signCount":@"143",
                            @"headIcon":@"icon",
                            @"drList":@[
                                    @{
                                        @"name":@"赵倩",
                                        @"headImage":@"icon",
                                        },
                                    @{
                                        @"name":@"吴思",
                                        @"headImage":@"icon",
                                        },
                                    @{
                                        @"name":@"李时",
                                        @"headImage":@"icon",
                                        },
                                    @{
                                        @"name":@"郭世杰",
                                        @"headImage":@"icon",
                                        },
                                    ],
                            },
                        ];
    return arrData;
}

@end
