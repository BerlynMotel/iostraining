//
//  BBBPostTableViewCell.h
//  BeyBulletinBoard
//
//  Created by Berlyn Motel on 12/10/14.
//  Copyright (c) 2014 Berlyn Motel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBBPostTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *postDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *userLabel;

@end
