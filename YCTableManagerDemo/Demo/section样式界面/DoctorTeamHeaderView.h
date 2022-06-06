//
//  DoctorTeamHeaderView.h
//  Demo
//
//  Created by 蔡亚超 on 2018/12/17.
//  Copyright © 2018 WellsCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DoctorTeamSection;
@interface DoctorTeamHeaderView : UITableViewHeaderFooterView
@property(nonatomic,strong)UIImageView          *imageView;
@property(nonatomic,strong)UILabel              *nameLabel;
@property(nonatomic,strong)UILabel              *contentLabel;
@property(nonatomic,strong)UIButton             *spreadButton;

@property(nonatomic,strong)DoctorTeamSection     *teamSection;
@property(nonatomic,  copy)void(^buttonClickHandle)(BOOL isSpread);
@end
