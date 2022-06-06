//
//  YCImageItem.h
//  Demo
//
//  Created by 蔡亚超 on 2019/3/15.
//  Copyright © 2019 WellsCai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YCCollectionProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface YCImageItem : NSObject<YCCollectionItemContext>

@property(nonatomic,copy)NSString       *imageName;
@property(nonatomic,copy)NSString       *title;

@end

NS_ASSUME_NONNULL_END
