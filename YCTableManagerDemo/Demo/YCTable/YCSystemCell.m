//
//  YCSystemCell.m
//  Demo
//
//  Created by 蔡亚超 on 2018/12/5.
//  Copyright © 2018年 WellsCai. All rights reserved.
//

#import "YCSystemCell.h"
#import "YCSystemRow.h"
#import "UITableViewCell+YCAdd.h"

@interface YCSystemCell()

@end

@implementation YCSystemCell
#pragma mark - Action

- (void)systemSwitchAction:(UISwitch *)sender{
    self.systemRow.isOn = sender.isOn;
    if (self.systemRow.switchActionHandle) {
        self.systemRow.switchActionHandle(sender.isOn,self.systemRow);
    }
}

#pragma mark - Setting&&Getting
- (void)setSystemRow:(YCSystemRow *)systemRow{
    [super setSystemRow:systemRow];
    // init
    
    switch (self.systemRow.contentType) {
        case YCSystemContentTypeDefault:
        {
            
        }
            break;
        case YCSystemContentTypeSwitch:
        {
            self.accessoryView = self.systemSwitch;
            self.systemSwitch.on = self.systemRow.isOn;
        }
            break;
        case YCSystemContentTypeImage:
        {
            [self.contentView addSubview:self.contentImageView];
            self.contentImageView.image = self.systemRow.contentImage;
        }
            break;
        default:
            break;
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.contentImageView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - self.systemRow.imageWidth - 30, self.contentView.frame.size.height * 0.5 - self.systemRow.imageWidth * 0.5, self.systemRow.imageWidth, self.systemRow.imageWidth);
}

- (UIImageView *)contentImageView{
    if (!_contentImageView) {
        _contentImageView = [[UIImageView alloc] init];
    }
    return _contentImageView;
}
- (UISwitch *)systemSwitch{
    if (!_systemSwitch) {
        _systemSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
        [_systemSwitch addTarget:self action:@selector(systemSwitchAction:) forControlEvents:UIControlEventValueChanged];
    }
    return _systemSwitch;
}
@end
