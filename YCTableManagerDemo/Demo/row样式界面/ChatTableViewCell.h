//
//  ChatTableViewCell.h
//  Demo
//
//  Created by 蔡亚超 on 2018/12/18.
//  Copyright © 2018 WellsCai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChatRow.h"

@interface ChatTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;

@property(nonatomic,strong)ChatRow  *chatRow;
@end
