//
//  ChatCell.m
//  Demo
//
//  Created by 蔡亚超 on 2018/12/16.
//  Copyright © 2018 WellsCai. All rights reserved.
//

#import "ChatCell.h"
#import "ChatRow.h"

@implementation ChatCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        {
            self.headImageView = [[UIImageView alloc] init];
            self.headImageView.frame = CGRectMake(10, 10, 40, 40);
            [self.contentView addSubview:self.headImageView];
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
    }
    return self;
}


#pragma mark -
- (void)setChatRow:(ChatRow *)chatRow{
    _chatRow = chatRow;
    
    self.nameLabel.text = chatRow.chatModel.name;
    self.contentLabel.text = chatRow.chatModel.content;
    self.headImageView.image = [UIImage imageNamed:chatRow.chatModel.headIcon];
}
@end
