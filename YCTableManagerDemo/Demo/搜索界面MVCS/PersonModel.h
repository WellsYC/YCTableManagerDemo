//
//  PersonModel.h
//  Demo
//
//  Created by 蔡亚超 on 2018/12/25.
//  Copyright © 2018 WellsCai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableDataProtocol.h"

@interface PersonModel : NSObject<TableDataProtocol>
@property(nonatomic,copy)NSString       *name;
@property(nonatomic,copy)NSString       *imageName;
@property(nonatomic,copy)NSString       *gender;

@end
