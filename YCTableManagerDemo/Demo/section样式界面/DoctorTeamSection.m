//
//  DoctorTeamSection.m
//  Demo
//
//  Created by 蔡亚超 on 2018/12/17.
//  Copyright © 2018 WellsCai. All rights reserved.
//

#import "DoctorTeamSection.h"
#import "MJExtension.h"

@implementation DoctorTeamSection
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"rows":@"drList"};
}
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"rows":@"DoctorRow",};
}

- (void)prepare{
    [super prepare];
    self.headerHeight = 60;
    self.isSpread = YES;
}

@end
