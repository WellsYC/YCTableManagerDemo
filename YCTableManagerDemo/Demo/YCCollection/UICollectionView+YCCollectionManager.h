//
//  UICollectionView+YCCollectionManager.h
//  Demo
//
//  Created by 蔡亚超 on 2019/1/31.
//  Copyright © 2019 WellsCai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YCCollectionManager.h"


@interface UICollectionViewFlowLayout (YCCollectionManager)
- (instancetype)initWithLineNumber:(NSUInteger)LineNum interitemSpacing:(CGFloat)interitemSpacing itemHeight:(CGFloat)itemH;

- (instancetype)initWithLineNumber:(NSUInteger)LineNum interitemSpacing:(CGFloat)interitemSpacing itemRatio:(CGFloat)ratio;

@end



@interface UICollectionView (YCCollectionManager)
@property(nonatomic,strong)YCCollectionManager          *collectionManager;

// init
+ (instancetype)collectionViewWithFrame:(CGRect)frame itemSize:(CGSize)size;
// register class
- (void)registerClass:(Class)cellClass fromXib:(BOOL)fromXib;

@end
