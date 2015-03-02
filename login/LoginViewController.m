//
//  ViewController.m
//  login
//
//  Created by Marcus Vinicius Kuquert on 2/26/15.
//  Copyright (c) 2015 Marcus Vinicius Kuquert. All rights reserved.
//

#import "LoginViewController.h"
#import "FirstViewController.h"
#import "MainTabBarContrroller.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UIButton *signinButton;
@property (weak, nonatomic) IBOutlet UIButton *signupButton;

@end

@implementation LoginViewController
-(void)viewWillAppear:(BOOL)animated{
    _signinButton.layer.cornerRadius = 18;
    _signinButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    _signinButton.layer.borderWidth = 1;
    
    _signupButton.layer.cornerRadius = 18;
    _signupButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    _signupButton.layer.borderWidth = 1;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
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
            _user = [[User alloc] initWithDictioary:users];
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"gotoMain"]) {
        MainTabBarContrroller  *tabBar = (MainTabBarContrroller *)segue.destinationViewController;
        FirstViewController *main = (FirstViewController *)[tabBar.viewControllers objectAtIndex:0];
        main.user = _user;
    }
}

-(IBAction)backToLogin:(UIStoryboardSegue *)segue{
    
}


@end
