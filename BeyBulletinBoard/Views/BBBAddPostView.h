//
//  BBBAddPostView.h
//  BeyBulletinBoard
//
//  Created by Berlyn Motel on 12/10/14.
//  Copyright (c) 2014 Berlyn Motel. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BBBAddPostViewDelegate <NSObject>

@required
-(void) addPostAction;
-(void) cancelButtonPressed;

@end

@interface BBBAddPostView : UIView
@property (weak, nonatomic) IBOutlet UITextField *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *postDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIButton *addPostAction;
@property (weak, nonatomic) IBOutlet UIButton *cancelButtonPressed;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)addPostAction:(id)sender;
- (IBAction)cancelButtonPressed:(id)sender;

@property (strong) id<BBBAddPostViewDelegate> delegate;

@end
