//
//  YCCollectionManager.m
//  Demo
//
//  Created by 蔡亚超 on 2019/1/31.
//  Copyright © 2019 WellsCai. All rights reserved.
//

#import "YCCollectionManager.h"
#import "UICollectionView+YCCollectionManager.h"

@interface YCCollectionManager()
@property(nonatomic,strong)NSMutableArray           *mutableItems;
@end

@implementation YCCollectionManager

+ (instancetype)managerWithItems:(NSArray *)collectionItems{
    YCCollectionManager *manager = [YCCollectionManager new];
    manager.collectionItems = collectionItems;
    return manager;
}

- (instancetype)init{
    if (self = [super init]) {
        _cellClass = [UICollectionViewCell class];
    }
    return self;
}

#pragma mark -
- (void)registClass{
    if (!_collectionView||!_cellClass) return;
    
    [_collectionView registerClass:[_cellClass class] fromXib:_cellFromXib];
}

- (void)setCollectionView:(UICollectionView *)collectionView{
    _collectionView = collectionView;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
}

#pragma mark -
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    [self registClass];
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.collectionItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = NSStringFromClass([self.cellClass class]);

    UICollectionViewCell<YCCollectionCellContext> *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
    if (self.cellForItemBlock) {
        id<YCCollectionItemContext> item = self.collectionItems[indexPath.item];
        self.cellForItemBlock(cell, item);
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    if (self.didSelectItemBlock) {
        id<YCCollectionItemContext> item = self.collectionItems[indexPath.item];
        self.didSelectItemBlock(collectionView, indexPath ,item);
    }
}

- (void)resetCollectionItems:(NSArray<id<YCCollectionItemContext>>*)items{
    [self.mutableItems removeAllObjects];
    [self resetItems];
}

- (void)clearCollectionItems{
    [self.mutableItems removeAllObjects];
    [self resetItems];
}

- (void)resetItems{
    self.collectionItems = [NSArray arrayWithArray:self.mutableItems];
}

- (void)insertItem:(id<YCCollectionItemContext>)item atIndexPath:(NSIndexPath *)indexPath{
    [self.mutableItems insertObject:item atIndex:indexPath.item];
    
    [_collectionView reloadItemsAtIndexPaths:@[indexPath]];
}

- (void)removeItemAtIndexPath:(NSIndexPath *)indexPath{
    id<YCCollectionItemContext> item = self.collectionItems[indexPath.item];
    [self.mutableItems addObject:item];
    [_collectionView reloadItemsAtIndexPaths:@[indexPath]];
}

- (void)addItems:(NSArray<id<YCCollectionItemContext>>*)items{
    if (!items) return;
    [self.mutableItems addObjectsFromArray:items];
    
    [_collectionView reloadData];
}

#pragma mark - Lazy Loading
- (NSMutableArray *)mutableItems{
    if (!_mutableItems) {
        _mutableItems = [NSMutableArray arrayWithArray:self.collectionItems];
    }
    return _mutableItems;
}

@end
