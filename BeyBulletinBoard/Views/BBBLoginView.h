//
//  BBBLoginView.h
//  BeyBulletinBoard
//
//  Created by Berlyn Motel on 12/9/14.
//  Copyright (c) 2014 Berlyn Motel. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BBBLoginViewDelegate <NSObject>

@required
-(void) loginButtonPressed;

@end

@interface BBBLoginView : UIView

// IBOutlets
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

// IBActions
- (IBAction)loginButtonPressed:(id)sender;

@property (strong) id<BBBLoginViewDelegate> delegate;

@end
