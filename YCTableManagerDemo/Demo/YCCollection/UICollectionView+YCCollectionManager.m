//
//  UICollectionView+YCCollectionManager.m
//  Demo
//
//  Created by 蔡亚超 on 2019/1/31.
//  Copyright © 2019 WellsCai. All rights reserved.
//

#import "UICollectionView+YCCollectionManager.h"
#import <objc/runtime.h>


@implementation UICollectionViewFlowLayout (YCCollectionManager)

- (instancetype)initWithLineNumber:(NSUInteger)lineNum interitemSpacing:(CGFloat)interitemSpacing itemHeight:(CGFloat)itemH{
    if (self = [super init]) {
        self.minimumInteritemSpacing = interitemSpacing;
        // 设置item的大小
        CGFloat itemW = ([UIScreen mainScreen].bounds.size.width -((CGFloat)lineNum + 1) * interitemSpacing)/lineNum - 0.001;
        if (itemH <= 0) {
            itemH = itemW;
        }
        self.sectionInset = UIEdgeInsetsMake(interitemSpacing, interitemSpacing,interitemSpacing, interitemSpacing);

        self.itemSize = CGSizeMake(itemW, itemH);
    }
    return self;
}

- (instancetype)initWithLineNumber:(NSUInteger)lineNum interitemSpacing:(CGFloat)interitemSpacing itemRatio:(CGFloat)ratio{
    if (self = [super init]) {
        self.minimumInteritemSpacing = interitemSpacing;
        // 设置item的大小
        CGFloat itemW = (([UIScreen mainScreen].bounds.size.width -(lineNum + 1) * interitemSpacing))/lineNum;
        self.itemSize = CGSizeMake(itemW, itemW/ratio);
        
        self.sectionInset = UIEdgeInsetsMake(interitemSpacing, interitemSpacing,interitemSpacing, interitemSpacing);
    }
    return self;
}

@end


@implementation UICollectionView (YCCollectionManager)

+ (instancetype)collectionViewWithFrame:(CGRect)frame itemSize:(CGSize)size{
    UICollectionViewFlowLayout  *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = size;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:flowLayout];
    return collectionView;
}

#pragma mark -
- (YCCollectionManager *)collectionManager{
    return objc_getAssociatedObject(self, @selector(collectionManager));
}

- (void)setCollectionManager:(YCCollectionManager *)collectionManager{
    objc_setAssociatedObject(self, @selector(collectionManager), collectionManager, OBJC_ASSOCIATION_RETAIN);
    collectionManager.collectionView = self;
}


#pragma mark - Register Class
- (void)registerClass:(Class)cellClass fromXib:(BOOL)fromXib{
    if (!fromXib) {
        [self registerClassForDefault:[cellClass class]];
    }else{
        [self registerNibForDefault:[cellClass class]];
    }
}

- (void)registerNibForDefault:(Class)nibClass{
    UINib *nib = [UINib nibWithNibName:NSStringFromClass(nibClass) bundle:nil];
    NSString *reuseIdentifier = NSStringFromClass(nibClass);
    [self registerNib:nib forCellWithReuseIdentifier:reuseIdentifier];
}

- (void)registerClassForDefault:(Class)codeClass{
    NSString *reuseIdentifier = NSStringFromClass(codeClass);
    [self registerClass:codeClass forCellWithReuseIdentifier:reuseIdentifier];
}


@end



