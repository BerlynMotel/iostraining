//
//  BBBPostView.h
//  BeyBulletinBoard
//
//  Created by Berlyn Motel on 12/10/14.
//  Copyright (c) 2014 Berlyn Motel. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BBBPostViewDelegate <NSObject>

@required
-(void) addCommentButtonPressed;

@end

@interface BBBPostView : UIView

@property (weak, nonatomic) IBOutlet UITextView *commentTextField;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UITextView *postDescriptionTextView;
@property (weak, nonatomic) IBOutlet UIButton *addCommentButton;
@property (weak, nonatomic) IBOutlet UITableView *commentTableView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)addCommentButtonPressed:(id)sender;

@property (strong) id<BBBPostViewDelegate> delegate;

@end
