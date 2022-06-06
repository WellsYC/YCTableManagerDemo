//
//  YCSystemRow.h
//  Demo
//
//  Created by 蔡亚超 on 2018/12/5.
//  Copyright © 2018年 WellsCai. All rights reserved.
//  用于构造简易系统cell

#import "YCBaseRow.h"

typedef NS_ENUM(NSInteger,YCSystemContentType){
    YCSystemContentTypeDefault = 0,
    YCSystemContentTypeSwitch,
    YCSystemContentTypeImage,
};

@interface YCSystemRow : YCBaseRow
// 设置原生cell
@property(nonatomic,strong)UIImage                           *image;
@property(nonatomic,  copy)NSString                          *title;
@property(nonatomic,  copy)NSString                          *detailTitle;
@property(nonatomic,strong)UIView                            *accessoryView;

// 额外添加的属性
@property(nonatomic,assign)YCSystemContentType                contentType;
@property(nonatomic,strong)UIImage                           *contentImage;

@property(nonatomic,assign)BOOL                               isOn;
@property(nonatomic,assign)CGFloat                            imageWidth;

@property(nonatomic,  copy)void(^switchActionHandle)(BOOL  isOn,YCBaseRow *row);

+ (instancetype)rowWithImage:(UIImage *)image title:(NSString *)title detailTitle:(NSString *)detailTitle;

@end
