//
//  BBBHomeView.h
//  BeyBulletinBoard
//
//  Created by Berlyn Motel on 12/9/14.
//  Copyright (c) 2014 Berlyn Motel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBBHomeView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;

- (IBAction)logoutButtonPressed:(id)sender;

- (IBAction)addNewPostButton:(id)sender;

@end
