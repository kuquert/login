//
//  ResiterViewController.m
//  login
//
//  Created by Marcus Vinicius Kuquert on 2/26/15.
//  Copyright (c) 2015 Marcus Vinicius Kuquert. All rights reserved.
//

#import "RegisterViewController.h"
#import "User.h"

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;

@end

@implementation RegisterViewController

-(void)viewWillAppear:(BOOL)animated{
    
    _cancelButton.layer.cornerRadius = 18;
    _cancelButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    _cancelButton.layer.borderWidth = 1;
    
    _doneButton.layer.cornerRadius = 18;
    _doneButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    _doneButton.layer.borderWidth = 1;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)doneButton:(UIButton *)sender {
    User *newUser = [[User alloc] init];
    newUser.name=_nameField.text;
    newUser.email=_emailField.text;
    newUser.password=_passwordField.text;
    newUser.username=_usernameField.text;
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Users" ofType:@"plist"]];
    NSLog(@"%@", [newUser createDictionaryForUSer:newUser]);
    [array addObject:[newUser createDictionaryForUSer:newUser]];
    NSLog(@"%@", array);
    NSLog(@"%d", [array writeToFile:[[NSBundle mainBundle] pathForResource:@"Users" ofType:@"plist"] atomically:YES]);
    [self performSegueWithIdentifier:@"gotoMain" sender:sender];
}


@end
