//
//  BBBLoginView.m
//  BeyBulletinBoard
//
//  Created by Berlyn Motel on 12/9/14.
//  Copyright (c) 2014 Berlyn Motel. All rights reserved.
//

#import "BBBLoginView.h"

@implementation BBBLoginView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)loginButtonPressed:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(loginButtonPressed)]) {
        [self.delegate loginButtonPressed];
    }
}

@end
