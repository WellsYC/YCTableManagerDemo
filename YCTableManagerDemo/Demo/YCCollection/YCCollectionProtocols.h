//
//  YCCollectionProtocols.h
//  Demo
//
//  Created by 蔡亚超 on 2019/3/14.
//  Copyright © 2019 WellsCai. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YCCollectionItemContext <NSObject>

@end

@protocol YCCollectionCellContext <NSObject>
- (void)setCollectionItem:(id<YCCollectionItemContext>)item;
@end


