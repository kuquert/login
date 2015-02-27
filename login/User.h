//
//  User.h
//  login
//
//  Created by Marcus Vinicius Kuquert on 2/27/15.
//  Copyright (c) 2015 Marcus Vinicius Kuquert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property NSString *name;
@property NSString *username;
@property NSString *password;
@property NSString *email;

-(NSDictionary *)createDictionaryForUSer:(User *)user;
- (User *)initWithDictioary:(NSDictionary *)object;

@end
