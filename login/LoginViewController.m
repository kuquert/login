//
//  ViewController.m
//  login
//
//  Created by Marcus Vinicius Kuquert on 2/26/15.
//  Copyright (c) 2015 Marcus Vinicius Kuquert. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)loginButton:(UIButton *)sender {
    
    BOOL didFail = NO;
    NSArray *array = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Users" ofType:@"plist"]];
    for (int i = 0 ; i<[array count]; i++) {
        NSDictionary *users = [[NSDictionary alloc] initWithDictionary:[array objectAtIndex:i]];
        
        if([[_usernameField text] isEqualToString:[users valueForKey:@"username"]] &&
           [[_passwordField text] isEqualToString:[users valueForKey:@"password"]])
        {
            didFail = NO;
            [self performSegueWithIdentifier:@"gotoMain" sender:sender];
             break;
        }
        else
            didFail = YES;
    }
    if (didFail){
        UIAlertView *fail = [[UIAlertView alloc] initWithTitle:@"Login Fail" message:@"Wrong username or password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [fail show];
    }
}
-(IBAction)backFromRegister:(UIStoryboardSegue *)segue{
    
    MainViewController *vcd = (MainViewController   *)segue.sourceViewController;
    
    NSLog(@"%@", vcd);
}



@end
