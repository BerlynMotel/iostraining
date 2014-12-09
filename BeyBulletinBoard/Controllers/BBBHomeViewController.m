//
//  BBBHomeViewController.m
//  BeyBulletinBoard
//
//  Created by Berlyn Motel on 12/9/14.
//  Copyright (c) 2014 Berlyn Motel. All rights reserved.
//

#import "BBBHomeViewController.h"

@interface BBBHomeViewController ()

@end

@implementation BBBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // hides back button upon logging in
    self.navigationItem.hidesBackButton = YES;
    
    self.homeView = (BBBHomeView*)[self getCustomXibUsingXibName:@"HomeView"];
    
    [self.view addSubview:self.homeView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
