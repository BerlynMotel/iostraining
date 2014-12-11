//
//  BBBPostView.m
//  BeyBulletinBoard
//
//  Created by Berlyn Motel on 12/10/14.
//  Copyright (c) 2014 Berlyn Motel. All rights reserved.
//

#import "BBBPostView.h"

@implementation BBBPostView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)addCommentButtonPressed:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(addCommentButtonPressed)]) {
        [self.delegate addCommentButtonPressed];
    }

}
@end
