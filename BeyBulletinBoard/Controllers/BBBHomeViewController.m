//
//  BBBHomeViewController.m
//  BeyBulletinBoard
//
//  Created by Berlyn Motel on 12/9/14.
//  Copyright (c) 2014 Berlyn Motel. All rights reserved.
//

#import "BBBHomeViewController.h"
#import "AppDelegate.h"
#import "Post.h"

@interface BBBHomeViewController (){
    NSMutableArray *titles;
    NSMutableArray *posts;
    NSMutableArray *users;
}

@end

@implementation BBBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if ([defaults objectForKey:@"isFirstRun"] == nil) {
        NSLog(@"first run");
        [defaults setObject:@"YES" forKey:@"isFirstRun"];
        
        // Init arrays
        titles = [[NSMutableArray alloc] initWithObjects:@"Sample Post 1", @"Sample Post 2", @"Sample Post 3", nil];
        posts = [[NSMutableArray alloc] initWithObjects:@"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.  ", @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.  ", @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ", nil];
        users = [[NSMutableArray alloc] initWithObjects:@"Mac", @"Bey", @"Jovie", nil];
        
        // Store arrays to NSUserDefaults
        [defaults setObject:titles forKey:@"titles"];
        [defaults setObject:posts forKey:@"posts"];
        [defaults setObject:users forKey:@"users"];
        
        [defaults synchronize];
    }
    
    [self initializeContents];
   
}

-(void) initializeContents{
    // hides back button upon logging in
    self.navigationItem.hidesBackButton = YES;
    
    self.homeView = (BBBHomeView*)[self getCustomXibUsingXibName:@"HomeView"];
    self.homeView.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height);
    
    // Set delegates
    self.homeView.delegate = self;
    self.homeView.postTableView.delegate = self;
    self.homeView.postTableView.dataSource = self;
    
    // Init nsuserdefaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *username = [defaults objectForKey:@"username"];
    
    // Set values of UIView elements
    NSString *uname = [NSString stringWithFormat:@"%@ %@%@", @"Hi", username, @"!"];
    self.homeView.usernameLabel.text =  uname;
    if ([username isEqualToString:@"bey"]) {
        self.homeView.profilePicture.image = [UIImage imageNamed:@"beybey"];

        //self.homeView.profilePicture.layer.cornerRadius = 41.0;
    }else{
        self.homeView.profilePicture.image = [UIImage imageNamed:@"head"];
        //self.homeView.profilePicture.layer.cornerRadius = 41.0;
    }
    
    [self.view addSubview:self.homeView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) logoutButtonPressed{
    NSLog(@"logout button pressed");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"username"];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) addNewPostButton {
    NSLog(@"add new post button pressed");
    
    [self performSegueWithIdentifier:@"homeToAddPostSegue" sender:self];
    
   /*NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *username = [defaults objectForKey:@"username"];
    
    NSMutableArray *persistenTitles = [[defaults arrayForKey:@"titles"]mutableCopy];
    NSMutableArray *persistentPosts = [[defaults arrayForKey:@"posts"]mutableCopy];
    NSMutableArray *persistentUsers = [[defaults arrayForKey:@"users"]mutableCopy];
    
    // Init arrays
    [persistenTitles addObject:@"be"];
    [persistentPosts addObject:@"test"];
    [persistentUsers addObject:username];
    
    // Store arrays to NSUserDefaults
    [defaults setObject:persistenTitles forKey:@"titles"];
    [defaults setObject:persistentPosts forKey:@"posts"];
    [defaults setObject:persistentUsers forKey:@"users"];
    
    [self.homeView.postTableView reloadData];*/
}

- (NSArray*) getAllPost{
    AppDelegate *ad = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Post" inManagedObjectContext:ad.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    NSArray *result = [ad.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if(error){
        //NSLog(@"Unable to execute fetch request");
        //NSLog(@"%@, %@", error, error.localizedDescription);
    }
    else{
        //NSLog(@"%@", result);
    }
    
    return result;
}


#pragma mark - UITableViewDataSource
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   /* NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *persistentTitles = [[defaults arrayForKey:@"titles"]mutableCopy];
    return persistentTitles.count;*/
    return [self getAllPost].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // Check which table is currently using this delegate method
    if (tableView == self.homeView.postTableView) { // check if what table view to load
        BBBPostTableViewCell *postCell = (BBBPostTableViewCell*) [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"PostCell"];
        
        if (postCell == nil) {
            postCell = [[[NSBundle mainBundle] loadNibNamed:@"PostTableViewCell" owner:nil options:nil] objectAtIndex:0];
        }
        
        /*NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSMutableArray *persistenTitles = [[defaults arrayForKey:@"titles"]mutableCopy];
        NSMutableArray *persistentPosts = [[defaults arrayForKey:@"posts"]mutableCopy];
        NSMutableArray *persistentUsers = [[defaults arrayForKey:@"users"]mutableCopy];
        
        postCell.titleLabel.text = [persistenTitles objectAtIndex:indexPath.row];
        postCell.postDescriptionLabel.text = [persistentPosts objectAtIndex:indexPath.row];
        postCell.userLabel.text = [persistentUsers objectAtIndex:indexPath.row];*/
        
        Post *post = [[self getAllPost] objectAtIndex:indexPath.row];
        postCell.titleLabel.text = post.title;
        postCell.postDescriptionLabel.text = post.body;
        postCell.userLabel.text = post.user;
        
        return postCell;
    }
    
    return nil;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"table cell pressed");
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    /*NSMutableArray *persistenTitles = [[defaults arrayForKey:@"titles"]mutableCopy];
    NSMutableArray *persistentPosts = [[defaults arrayForKey:@"posts"]mutableCopy];
    NSMutableArray *persistentUsers = [[defaults arrayForKey:@"users"]mutableCopy];

    // Init arrays
    NSString *title = [persistenTitles objectAtIndex:indexPath.row];
    NSString *post = [persistentPosts objectAtIndex:indexPath.row];
    NSString *author =[persistentUsers objectAtIndex:indexPath.row];*/
    
    Post *post = [[self getAllPost] objectAtIndex:indexPath.row];
    NSString *title = post.title;
    NSString *userpost = post.body;
    NSString *author = post.user;
    
    // Store arrays to NSUserDefaults
    [defaults setObject:title forKey:@"title"];
    [defaults setObject:userpost forKey:@"post"];
    [defaults setObject:author forKey:@"author"];
    
    [self performSegueWithIdentifier:@"HomeToViewPost" sender:self];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90.0;
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
