//
//  BBBHomeView.m
//  BeyBulletinBoard
//
//  Created by Berlyn Motel on 12/9/14.
//  Copyright (c) 2014 Berlyn Motel. All rights reserved.
//

#import "BBBHomeView.h"

@implementation BBBHomeView

- (IBAction)logoutButtonPressed:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(logoutButtonPressed)]) {
        [self.delegate logoutButtonPressed];
    }
}

- (IBAction)addNewPostButton:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(addNewPostButton)]) {
        [self.delegate addNewPostButton];
    }
}

@end
