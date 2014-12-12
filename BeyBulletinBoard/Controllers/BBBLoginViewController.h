//
//  BBBLoginViewController.h
//  BeyBulletinBoard
//
//  Created by Berlyn Motel on 12/9/14.
//  Copyright (c) 2014 Berlyn Motel. All rights reserved.
//

#import "BBBBaseUIViewController.h"
#import "BBBLoginView.h"

@interface BBBLoginViewController : BBBBaseUIViewController<BBBLoginViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) BBBLoginView *loginView;
@property (nonatomic, strong) IBOutlet UITapGestureRecognizer *tapRecognizer;

@end
