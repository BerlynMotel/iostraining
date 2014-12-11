//
//  BBBHomeViewController.h
//  BeyBulletinBoard
//
//  Created by Berlyn Motel on 12/9/14.
//  Copyright (c) 2014 Berlyn Motel. All rights reserved.
//

#import "BBBBaseUIViewController.h"
#import "BBBHomeView.h"
#import "BBBPostTableViewCell.h"

@interface BBBHomeViewController : BBBBaseUIViewController<BBBHomeViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) BBBHomeView *homeView;
@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) BBBPostTableViewCell *postTableView;

@end
