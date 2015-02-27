//
//  MainViewController.m
//  login
//
//  Created by Marcus Vinicius Kuquert on 2/26/15.
//  Copyright (c) 2015 Marcus Vinicius Kuquert. All rights reserved.
//

#import "MainViewController.h"
#import "LoginViewController.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UIButton *logoutButton;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property NSArray *array;

@end

@implementation MainViewController

-(void)viewWillAppear:(BOOL)animated{
    _logoutButton.layer.cornerRadius = 16;
    _logoutButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    _logoutButton.layer.borderWidth = 1;
    _array =[[NSArray alloc]initWithObjects:@"A", @"B", @"C", @"D", nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _label.text = self.user.name;
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    LoginViewController *lvc = (LoginViewController *)segue.destinationViewController;
    lvc.usernameField.text = nil;
    lvc.passwordField.text = nil;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_array count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = [_array objectAtIndex:[indexPath row]];
    return cell;
}

@end