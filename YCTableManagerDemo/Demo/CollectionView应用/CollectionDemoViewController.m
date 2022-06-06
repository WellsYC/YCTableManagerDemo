//
//  CollectionDemoViewController.m
//  Demo
//
//  Created by 蔡亚超 on 2019/3/14.
//  Copyright © 2019 WellsCai. All rights reserved.
//

#import "CollectionDemoViewController.h"
#import "UICollectionView+YCCollectionManager.h"
#import "YCImageItem.h"
#import "YCImageCell.h"


@interface CollectionDemoViewController ()
@property(nonatomic,strong)UICollectionView         *collectionView;
@end

@implementation CollectionDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    

    NSMutableArray  *arr = [NSMutableArray arrayWithCapacity:20];
    for (int i = 0; i < 20; i++) {
        YCImageItem *item = [YCImageItem new];
        item.imageName = @"icon";
        item.title = [NSString stringWithFormat:@"标题%d",i];
        [arr addObject:item];
    }

    YCCollectionManager *manager = [YCCollectionManager managerWithItems:arr];
    manager.cellFromXib = YES;
    manager.cellClass = [YCImageCell class];
    
    
    manager.cellForItemBlock = ^(UICollectionViewCell<YCCollectionCellContext> *cell, id<YCCollectionItemContext> item) {
        [cell setCollectionItem:item];
    };
    
    self.collectionView.collectionManager = manager;
}
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    self.collectionView.frame = self.view.bounds;
}


- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] initWithLineNumber:3 interitemSpacing:10 itemRatio:1];
        layout.minimumLineSpacing = 10;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds  collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}



@end
