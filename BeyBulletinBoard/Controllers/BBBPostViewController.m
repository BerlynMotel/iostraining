//
//  BBBPostViewController.m
//  BeyBulletinBoard
//
//  Created by Berlyn Motel on 12/10/14.
//  Copyright (c) 2014 Berlyn Motel. All rights reserved.
//

#import "BBBPostViewController.h"

@interface BBBPostViewController (){
    NSMutableArray *comments;
    NSMutableArray *commentby;
}

@end

@implementation BBBPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.postView = (BBBPostView*)[self getCustomXibUsingXibName:@"PostView"];
    self.postView.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:self.postView];
    
   /* NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *user = [defaults objectForKey:@"users"];
    NSString *title = [defaults objectForKey:@"titles"];
    NSString *post = [defaults objectForKey:@"posts"];*/
    
    // Init nsuserdefaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.postView.titleLabel.text =  [defaults objectForKey:@"title"];
    self.postView.authorLabel.text =  [defaults objectForKey:@"author"];
    self.postView.postDescriptionTextView.text =  [defaults objectForKey:@"post"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) addCommentButtonPressed {
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
