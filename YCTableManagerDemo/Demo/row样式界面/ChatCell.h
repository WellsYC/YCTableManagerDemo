//
//  ChatCell.h
//  Demo
//
//  Created by 蔡亚超 on 2018/12/16.
//  Copyright © 2018 WellsCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ChatRow;
@interface ChatCell : UITableViewCell
@property(nonatomic,strong)UIImageView          *headImageView;
@property(nonatomic,strong)UILabel              *nameLabel;
@property(nonatomic,strong)UILabel              *contentLabel;

@property(nonatomic,strong)ChatRow              *chatRow;
@end
