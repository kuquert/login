//
//  User.m
//  login
//
//  Created by Marcus Vinicius Kuquert on 2/27/15.
//  Copyright (c) 2015 Marcus Vinicius Kuquert. All rights reserved.
//

#import "User.h"

@implementation User

-(NSDictionary *)createDictionaryForUSer:(User *)user{
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                                user.name, @"name",
                                user.username, @"username",
                                user.password, @"password",
                                user.email, @"email", nil];
    return dictionary;
}

- (User *)initWithDictioary:(NSDictionary *)object
{
    self = [super init];
    if (self) {
        _name = [object valueForKey:@"name"];
        _email = [object valueForKey:@"email"];
        _username = [object valueForKey:@"username"];
        _password = [object valueForKey:@"password"];
    }
    return self;
}
@end
