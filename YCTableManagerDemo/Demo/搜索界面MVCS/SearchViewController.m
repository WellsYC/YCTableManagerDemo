//
//  SearchViewController.m
//  Demo
//
//  Created by 蔡亚超 on 2018/12/20.
//  Copyright © 2018 WellsCai. All rights reserved.
//

#import "SearchViewController.h"
#import "YCTableDataSource.h"
#import "PersonModel.h"
#import "SearchController.h"
#import "TableController.h"
#import "SearchDataController.h"

@interface SearchViewController ()<SearchControllerDelegate>

@property(nonatomic,strong)SearchController         *searchController;
@property(nonatomic,strong)TableController          *tableController;
@property(nonatomic,strong)SearchDataController     *dataController;

@end

@implementation SearchViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
    [self addUI];
    
    self.dataController = [SearchDataController new];
    [self search:nil];
    
}
- (void)searchTextDidChange:(NSString *)searchText{
    [self search:searchText];
}

- (void)search:(NSString *)params{
    [self.dataController fetchParams:params Data:^(NSArray *persons) {
        [self.tableController reloadData:persons];
    }];
}


- (void)addUI{
    self.searchController = [SearchController new];
    self.searchController.searchBar.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60);
    [self.view addSubview:self.searchController.searchBar];
    
    self.tableController = [TableController new];
    self.tableController.tableView.frame = CGRectMake(0, CGRectGetMaxY(self.searchController.searchBar.frame), [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height - CGRectGetMaxY(self.searchController.searchBar.frame));
    [self.view addSubview:self.tableController.tableView];
    
    self.searchController.delegate = self;
}







@end
