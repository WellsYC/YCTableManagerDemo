//
//  DemoViewController.m
//  Demo
//
//  Created by 蔡亚超 on 2018/12/13.
//  Copyright © 2018年 WellsCai. All rights reserved.
//

#import "DemoViewController.h"

@interface DemoViewController ()
@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    }
    return _tableView;
}

@end
