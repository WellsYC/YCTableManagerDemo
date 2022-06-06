//
//  ChatTableViewCell.m
//  Demo
//
//  Created by 蔡亚超 on 2018/12/18.
//  Copyright © 2018 WellsCai. All rights reserved.
//

#import "ChatTableViewCell.h"

@implementation ChatTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

#pragma mark -
- (void)setChatRow:(ChatRow *)chatRow{
    _chatRow = chatRow;
    
    self.nameLabel.text = chatRow.chatModel.name;
    self.contentLabel.text = chatRow.chatModel.content;
    self.headImageView.image = [UIImage imageNamed:chatRow.chatModel.headIcon];
}

@end
