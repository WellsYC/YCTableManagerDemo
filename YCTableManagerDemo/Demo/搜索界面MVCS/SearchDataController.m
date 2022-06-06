//
//  SearchDataController.m
//  Demo
//
//  Created by 蔡亚超 on 2018/12/27.
//  Copyright © 2018 WellsCai. All rights reserved.
//

#import "SearchDataController.h"
#import "PersonModel.h"

@implementation SearchDataController

- (void)fetchParams:(NSString *)params Data:(SuccessBlock)successBlock{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        successBlock([self persons]);
    });
}

- (NSArray *)persons{
    PersonModel *model1 = [PersonModel new];
    model1.name = @"张三";
    model1.imageName = @"icon";
    model1.gender = @"男";
    
    PersonModel *model2 = [PersonModel new];
    model2.name = @"李四";
    model2.imageName = @"icon";
    model2.gender = @"男";
    
    
    PersonModel *model3 = [PersonModel new];
    model3.name = @"王云";
    model3.imageName = @"icon";
    model3.gender = @"女";
    
    return @[model1,model2,model3];
}
@end
