//
//  ITViewController.m
//  Parse Test
//
//  Created by yousheng chang on 8/30/14.
//  Copyright (c) 2014 InfoTech Inc. All rights reserved.
//

#import "ITViewController.h"

@interface ITViewController ()
@property (strong, nonatomic) IBOutlet UITextField *userNameTextField;

@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation ITViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    /*
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    [testObject setObject:@"bar" forKey:@"foo"];
    [testObject save];
     */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveUserButtonPressed:(UIButton *)sender {
    
    [self resignFirstResponder];
    
    PFObject *user = [PFObject objectWithClassName:@"User"];
    user[@"userName"] = self.userNameTextField.text;
    user[@"password"] = self.passwordTextField.text;
    
    
    
    [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if(succeeded){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Saved" message:@"The user is saved" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            NSLog(@"The user is saved");
        }else{
            NSLog(@"%@", error);
        }
    }];
    
   
    
    
}

@end
