//
//  BBBAddPostViewController.h
//  BeyBulletinBoard
//
//  Created by Berlyn Motel on 12/10/14.
//  Copyright (c) 2014 Berlyn Motel. All rights reserved.
//

#import "BBBBaseUIViewController.h"
#import "BBBAddPostView.h"
#import "BBBPostTableViewCell.h"

@interface BBBAddPostViewController : BBBBaseUIViewController<BBBAddPostViewDelegate, UITextFieldDelegate, UITextViewDelegate>

@property (strong, nonatomic) BBBAddPostView *addPostView;
@property (strong, nonatomic) BBBPostTableViewCell *postTableView;

@end
