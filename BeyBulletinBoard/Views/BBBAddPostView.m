//
//  BBBAddPostView.m
//  BeyBulletinBoard
//
//  Created by Berlyn Motel on 12/10/14.
//  Copyright (c) 2014 Berlyn Motel. All rights reserved.
//

#import "BBBAddPostView.h"

@implementation BBBAddPostView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)addPostAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(addPostAction)]) {
        [self.delegate addPostAction];
    }
}

- (IBAction)cancelButtonPressed:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(cancelButtonPressed)]) {
        [self.delegate cancelButtonPressed];
    }
}
@end
