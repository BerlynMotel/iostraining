//
//  BBBAddPostViewController.m
//  BeyBulletinBoard
//
//  Created by Berlyn Motel on 12/10/14.
//  Copyright (c) 2014 Berlyn Motel. All rights reserved.
//

#import "BBBAddPostViewController.h"

@interface BBBAddPostViewController (){
    UITextField *activeField;

}

@end

@implementation BBBAddPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.addPostView = (BBBAddPostView*)[self getCustomXibUsingXibName:@"AddPostView"];
    self.addPostView.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height);
    
    [self.view addSubview:self.addPostView];
    self.addPostView.delegate = self;
    self.addPostView.titleLabel.delegate = self;
    self.addPostView.postDescriptionLabel.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) cancelButtonPressed {
    NSLog(@"cancel button pressed");
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) addPostAction {
    NSLog(@"add post button pressed");
   
    NSString *titleLabel = self.addPostView.titleLabel.text;
    NSString *postDescriptionLabel = self.addPostView.postDescriptionLabel.text;
    
    
    if (titleLabel.length > 0 || postDescriptionLabel.length > 0) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *username = [defaults objectForKey:@"username"];
        
        NSMutableArray *persistenTitles = [[defaults arrayForKey:@"titles"]mutableCopy];
        NSMutableArray *persistentPosts = [[defaults arrayForKey:@"posts"]mutableCopy];
        NSMutableArray *persistentUsers = [[defaults arrayForKey:@"users"]mutableCopy];
        
        // Init arrays
        [persistenTitles addObject:titleLabel];
        [persistentPosts addObject:postDescriptionLabel];
        [persistentUsers addObject:username];
        
        // Store arrays to NSUserDefaults
        [defaults setObject:persistenTitles forKey:@"titles"];
        [defaults setObject:persistentPosts forKey:@"posts"];
        [defaults setObject:persistentUsers forKey:@"users"];
        
        NSString *msg = [NSString stringWithFormat:@"%@ %@", @"Successfully add", titleLabel];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        
        self.addPostView.titleLabel.text = nil;
        self.addPostView.postDescriptionLabel.text = nil;
    }
    else if([titleLabel isEqualToString:@""] || [postDescriptionLabel isEqualToString:@""]){
        NSLog(@"here");
        NSString *msg = [NSString stringWithFormat:@"%@", @"Title or post cannot be blank."];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
    
}



#pragma mark - UITestField Delegates
- (void) textFieldDidBeginEditing:(UITextField *)textField{
    activeField = textField;
}

- (void) textFieldDidEndEditing:(UITextField *)textField{
    activeField = nil;
    
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
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
    self.addPostView.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height + kbSize.height);
    
    // Scroll to visible active field
    [self.addPostView.scrollView scrollRectToVisible:visibleActiveFieldRect animated:YES];
}

- (void)keyboardWillBeHidden:(NSNotification *)aNotification {
    // Reset the content size of the scroll view
    self.addPostView.scrollView.contentSize = CGSizeMake(0.0, 0.0);
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
