//
//  YCCollectionManager.h
//  Demo
//
//  Created by 蔡亚超 on 2019/1/31.
//  Copyright © 2019 WellsCai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YCCollectionProtocols.h"

typedef void(^YCCellForItemBlock)(UICollectionViewCell<YCCollectionCellContext> *cell,id<YCCollectionItemContext> item);
typedef void(^YCDidSelectItemBlock)(UICollectionView *collectionView,NSIndexPath *indexPath,id<YCCollectionItemContext> item);

@interface YCCollectionManager : NSObject<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,  weak)UICollectionView          *collectionView;
// Setting
@property(nonatomic,strong,nonnull)NSArray                          *collectionItems;
@property(nonatomic,strong)Class                            cellClass;
@property(nonatomic,assign)BOOL                             cellFromXib;
// CallBack
@property(nonatomic,copy)YCCellForItemBlock                 cellForItemBlock;
@property(nonatomic,copy)YCDidSelectItemBlock               didSelectItemBlock;

// init
+ (instancetype)managerWithItems:(NSArray<id<YCCollectionItemContext>> *)collectionItems;

// Set up Items
- (void)resetCollectionItems:(NSArray<id<YCCollectionItemContext>>*)items;
- (void)clearCollectionItems;
- (void)insertItem:(id<YCCollectionItemContext>)item atIndexPath:(NSIndexPath *)indexPath;
- (void)removeItemAtIndexPath:(NSIndexPath *)indexPath;
- (void)addItems:(NSArray<id<YCCollectionItemContext>>*)items;

@end

