//
//  ScrollowDemoViewController.m
//  Demo
//
//  Created by 蔡亚超 on 2019/3/20.
//  Copyright © 2019 WellsCai. All rights reserved.
//

#import "ScrollowDemoViewController.h"

@interface ScrollowDemoViewController ()
@property(nonatomic,strong)UIView    *topView;
@property(nonatomic,strong)UIView    *bottomView;
@end

@implementation ScrollowDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(10, 0, 100, 100)];
    self.topView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.topView];
    
    
    self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(10, 400, 200, 300)];
    self.bottomView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.bottomView];

    self.navigationController.navigationBar.translucent = NO;
    self.contentHeight = 1000;
}


@end
