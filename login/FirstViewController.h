//
//  MainViewController.h
//  login
//
//  Created by Marcus Vinicius Kuquert on 2/26/15.
//  Copyright (c) 2015 Marcus Vinicius Kuquert. All rights reserved.
//

#import "LoginViewController.h"
#import "User.h"

@interface FirstViewController : LoginViewController<UITableViewDelegate, UITableViewDataSource>

@property User *user;

@end
