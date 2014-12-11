//
//  BBBCommentTableViewCell.h
//  BeyBulletinBoard
//
//  Created by Berlyn Motel on 12/11/14.
//  Copyright (c) 2014 Berlyn Motel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBBCommentTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentByLabel;

@end
