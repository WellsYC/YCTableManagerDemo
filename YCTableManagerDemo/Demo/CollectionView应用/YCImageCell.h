//
//  YCImageCell.h
//  Demo
//
//  Created by 蔡亚超 on 2019/3/15.
//  Copyright © 2019 WellsCai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YCCollection.h"

NS_ASSUME_NONNULL_BEGIN

@interface YCImageCell : UICollectionViewCell<YCCollectionCellContext>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

- (void)setCollectionItem:(id<YCCollectionItemContext>)item;

@end

NS_ASSUME_NONNULL_END
