//
//  BBBPostViewController.m
//  BeyBulletinBoard
//
//  Created by Berlyn Motel on 12/10/14.
//  Copyright (c) 2014 Berlyn Motel. All rights reserved.
//

#import "BBBPostViewController.h"
#import "Comment.h"
#import "AppDelegate.h"

@interface BBBPostViewController (){
   // UITextField *activeField;
    UITextView *activeField;
    NSMutableArray *comments;
    NSMutableArray *commentby;
}

@end

@implementation BBBPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"I'm here");
    // Do any additional setup after loading the view.
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyBoard)];
    [self.view addGestureRecognizer:tapGesture];
    
    self.postView = (BBBPostView*)[self getCustomXibUsingXibName:@"PostView"];
    self.postView.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:self.postView];
    
   /* NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *user = [defaults objectForKey:@"users"];
    NSString *title = [defaults objectForKey:@"titles"];
    NSString *post = [defaults objectForKey:@"posts"];*/
    
    [self registerForKeyboardNotifications];
    
    // Init nsuserdefaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.postView.titleLabel.text =  [defaults objectForKey:@"title"];
    self.postView.authorLabel.text =  [defaults objectForKey:@"author"];
    self.postView.postDescriptionTextView.text =  [defaults objectForKey:@"post"];
    
    self.postView.delegate = self;
    self.postView.commentTableView.delegate = self;
    self.postView.commentTableView.dataSource = self;
    self.postView.commentTextField.delegate = self;

}

-(void)hideKeyBoard {
    [self.postView.commentTextField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addCommentButtonPressed {
    NSLog(@"add comment button pressed");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *username = [defaults objectForKey:@"username"];
    NSString *comment = self.postView.commentTextField.text;

    if ( comment.length > 0) {
        AppDelegate *ad = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    
        NSEntityDescription *entityComment = [NSEntityDescription entityForName:@"Comment" inManagedObjectContext:ad.managedObjectContext];
        NSManagedObject *newComment = [[NSManagedObject alloc] initWithEntity:entityComment insertIntoManagedObjectContext:ad.managedObjectContext];
    
        [newComment setValue:self.postView.commentTextField.text forKey:@"comment_text"];
        [newComment setValue:username forKey:@"user"];
        [newComment setValue:[defaults objectForKey:@"title"] forKey:@"title"];
        self.postView.commentTextField.text = @"";
    
        NSError *error = nil;
        if (![newComment.managedObjectContext save:&error]) {
            NSLog(@"Unable to save managed object context");
            NSLog(@"%@, %@", error, error.localizedDescription);
        }else{
            NSLog(@"Yeheye");
        }
    
        [self.postView.commentTableView reloadData];
    }else{
        NSString *msg = [NSString stringWithFormat:@"Comment cannot be blank."];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
}


- (NSArray*) getAllComment{
    NSLog(@"getAllComments");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    AppDelegate *ad = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    //NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    //NSEntityDescription *entity = [NSEntityDescription entityForName:@"Comment" inManagedObjectContext:ad.managedObjectContext];
    //[fetchRequest setEntity:entity];
    
    // Fetching
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Comment"];
    // Create Predicate
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", @"title", [defaults objectForKey:@"title"]];
    [fetchRequest setPredicate:predicate];
    
    // Execute Fetch Request
    NSError *fetchError = nil;
    NSArray *result = [ad.managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
    
    if (!fetchError) {
        NSLog(@"Fetching successful!");
    
    } else {
        NSLog(@"Error fetching data.");
        NSLog(@"%@, %@", fetchError, fetchError.localizedDescription);
    }

    
    return result;
}


#pragma mark - UITableViewDataSource
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     NSLog(@"table view");
    /* NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
     NSMutableArray *persistentTitles = [[defaults arrayForKey:@"titles"]mutableCopy];
     return persistentTitles.count;*/
    return [self getAllComment].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // Check which table is currently using this delegate method
    if (tableView == self.postView.commentTableView) { // check if what table view to load
        BBBCommentTableViewCell *commentCell = (BBBCommentTableViewCell*) [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"CommentCell"];
        
        if (commentCell == nil) {
            commentCell = [[[NSBundle mainBundle] loadNibNamed:@"CommentTableViewCell" owner:nil options:nil] objectAtIndex:0];
        }
        
        /*NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
         NSMutableArray *persistenTitles = [[defaults arrayForKey:@"titles"]mutableCopy];
         NSMutableArray *persistentPosts = [[defaults arrayForKey:@"posts"]mutableCopy];
         NSMutableArray *persistentUsers = [[defaults arrayForKey:@"users"]mutableCopy];
         
         postCell.titleLabel.text = [persistenTitles objectAtIndex:indexPath.row];
         postCell.postDescriptionLabel.text = [persistentPosts objectAtIndex:indexPath.row];
         postCell.userLabel.text = [persistentUsers objectAtIndex:indexPath.row];*/
        
        Comment *post = [[self getAllComment] objectAtIndex:indexPath.row];
        commentCell.commentLabel.text = post.comment_text;
        commentCell.commentByLabel.text = post.user;
        
        return commentCell;
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
    
    Comment *comment = [[self getAllComment] objectAtIndex:indexPath.row];
    NSString *comment_text = comment.comment_text;
    NSString *comment_by = comment.user;
    
    // Store arrays to NSUserDefaults
    [defaults setObject:comment_text forKey:@"comment_text"];
    [defaults setObject:comment_by forKey:@"comment_by"];
    
    NSString *msg = [NSString stringWithFormat:@"%@ : %@", comment_by, comment_text];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
    //[self performSegueWithIdentifier:@"HomeToViewPost" sender:self];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.0;
}

#pragma mark - UITextView Delegates
- (void) textViewDidBeginEditing:(UITextView *)textView{
    activeField = textView;
}

- (void) textViewDidEndEditing:(UITextView *)textView{
    activeField = nil;
}

- (BOOL) textViewShouldReturn:(UITextView *) textView{
    [textView resignFirstResponder];
    return YES;
}

#pragma mark - Keyboard
- (void)registerForKeyboardNotifications {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWasShown:(NSNotification *)aNotification {
    // Get size of displayed keyboard
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    // Compute visible active field
    CGRect visibleActiveFieldRect = CGRectMake(activeField.frame.origin.x, activeField.frame.origin.y + kbSize.height, activeField.frame.size.width, activeField.frame.size.height + 15);
    
    // Adjust scroll view content size
    self.postView.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height + kbSize.height);
    
    // Scroll to visible active field
    [self.postView.scrollView scrollRectToVisible:visibleActiveFieldRect animated:YES];
}

- (void)keyboardWillBeHidden:(NSNotification *)aNotification {
    // Reset the content size of the scroll view
    self.postView.scrollView.contentSize = CGSizeMake(0.0, 0.0);
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
