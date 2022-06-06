//
//  YCScrollowViewController.m
//  Demo
//
//  Created by 蔡亚超 on 2019/3/19.
//  Copyright © 2019 WellsCai. All rights reserved.
//

#import "YCScrollowViewController.h"

@interface YCScrollowViewController ()
@property(nonatomic,strong)UIScrollView         *scrollView;
@end

@implementation YCScrollowViewController

- (void)loadView{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    scrollView.backgroundColor = [UIColor whiteColor];
    
    if (@available(iOS 11.0, *)) {
        scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    self.scrollView = scrollView;
    self.view = scrollView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setContentHeight:(CGFloat)contentHeight{
    _contentHeight = contentHeight;
    self.scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, contentHeight);
}

@end
