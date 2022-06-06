//
//  DoctorTeamHeaderView.m
//  Demo
//
//  Created by 蔡亚超 on 2018/12/17.
//  Copyright © 2018 WellsCai. All rights reserved.
//

#import "DoctorTeamHeaderView.h"
#import "DoctorTeamSection.h"

@implementation DoctorTeamHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        {
            self.imageView = [[UIImageView alloc] init];
            self.imageView.frame = CGRectMake(10, 10, 40, 40);
            [self.contentView addSubview:self.imageView];
        }
        {
            self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 10, 200, 20)];
            self.nameLabel.font = [UIFont systemFontOfSize:15];
            self.nameLabel.textColor = [UIColor darkGrayColor];
            [self.contentView addSubview:self.nameLabel];
        }
        {
            self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 10 + 20, 200, 20)];
            self.contentLabel.font = [UIFont systemFontOfSize:15];
            self.contentLabel.textColor = [UIColor lightGrayColor];
            [self.contentView addSubview:self.contentLabel];
        }
        {
            self.spreadButton = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 60, 10, 60, 40)];
            [self.spreadButton setImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
            [self.spreadButton setImage:[UIImage imageNamed:@"down"] forState:UIControlStateSelected];
            [self.spreadButton addTarget:self action:@selector(spreadButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.contentView addSubview:self.spreadButton];
        }
        
    }
    return self;
}

- (void)spreadButtonClick:(UIButton *)sender{
    sender.selected = !sender.isSelected;
    self.teamSection.isSpread = sender.isSelected;
    if (self.buttonClickHandle) {
        self.buttonClickHandle(sender.isSelected);
    }
}
- (void)setTeamSection:(DoctorTeamSection *)teamSection{
    _teamSection = teamSection;
    self.spreadButton.selected = teamSection.isSpread;
    self.nameLabel.text = teamSection.name;
    self.contentLabel.text = [NSString stringWithFormat:@"签约人数:%@人",teamSection.signCount];
    self.imageView.image = [UIImage imageNamed:teamSection.headIcon];
}

@end
