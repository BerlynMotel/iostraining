//
//  BBBPostViewController.h
//  BeyBulletinBoard
//
//  Created by Berlyn Motel on 12/10/14.
//  Copyright (c) 2014 Berlyn Motel. All rights reserved.
//

#import "BBBBaseUIViewController.h"
#import "BBBPostView.h"
#import "BBBCommentTableViewCell.h"

@interface BBBPostViewController : BBBBaseUIViewController<BBBPostViewDelegate,UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UITextViewDelegate>

@property (strong, nonatomic) BBBPostView *postView;
@property (strong, nonatomic) BBBCommentTableViewCell *commentTableView;

@end
