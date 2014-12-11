//
//  BBBHomeView.h
//  BeyBulletinBoard
//
//  Created by Berlyn Motel on 12/9/14.
//  Copyright (c) 2014 Berlyn Motel. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BBBHomeViewDelegate <NSObject>

@required
-(void) addNewPostButton;
-(void) logoutButtonPressed;

@end

@interface BBBHomeView : UIView

// IBOutlets
@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UIButton *addNewPostButton;
@property (weak, nonatomic) IBOutlet UIButton *logoutButtonPressed;
@property (weak, nonatomic) IBOutlet UITableView *postTableView;

// IBActions
- (IBAction)logoutButtonPressed:(id)sender;
- (IBAction)addNewPostButton:(id)sender;

@property (strong) id<BBBHomeViewDelegate> delegate;

@end