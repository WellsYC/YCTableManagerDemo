//
//  SearchDataController.h
//  Demo
//
//  Created by 蔡亚超 on 2018/12/27.
//  Copyright © 2018 WellsCai. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)(NSArray *persons);

@interface SearchDataController : NSObject
- (void)fetchParams:(NSString *)params Data:(SuccessBlock)successBlock;
@end
