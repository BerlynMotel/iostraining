//
//  Comment.h
//  BeyBulletinBoard
//
//  Created by Berlyn Motel on 12/11/14.
//  Copyright (c) 2014 Berlyn Motel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Post;

@interface Comment : NSManagedObject

@property (nonatomic, retain) NSString * comment_text;
@property (nonatomic, retain) NSString * user;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) Post *post;

@end
