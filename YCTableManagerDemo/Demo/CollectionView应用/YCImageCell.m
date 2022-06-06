//
//  YCImageCell.m
//  Demo
//
//  Created by 蔡亚超 on 2019/3/15.
//  Copyright © 2019 WellsCai. All rights reserved.
//

#import "YCImageCell.h"
#import "YCImageItem.h"

@implementation YCImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = [UIColor yellowColor];
}

- (void)setCollectionItem:(id<YCCollectionItemContext>)item{
    YCImageItem *newItem = (YCImageItem *)item;
    self.imageView.image = [UIImage imageNamed:newItem.imageName];
    self.titleLabel.text = newItem.title;
}

@end
