//
//  SecondViewController.m
//  login
//
//  Created by Marcus Vinicius Kuquert on 2/28/15.
//  Copyright (c) 2015 Marcus Vinicius Kuquert. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController()
@property (weak, nonatomic) IBOutlet UITextField *aField;
@property (weak, nonatomic) IBOutlet UITextField *bField;
@property (weak, nonatomic) IBOutlet UITextField *cField;
@property (weak, nonatomic) IBOutlet UILabel *x1Value;
@property (weak, nonatomic) IBOutlet UILabel *x2VAlue;
@property NSMutableArray *valuesArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SecondViewController

-(void)viewDidLoad{
     _valuesArray = [[NSMutableArray alloc] init];
}

- (IBAction)calculate:(UIButton *)sender {
    NSInteger a = [_aField.text integerValue];
    NSInteger b = [_bField.text integerValue];
    NSInteger c = [_cField.text integerValue];
    
    float delta = (b*b-4*a*c);
    float x1, x2;
    if (delta >= 0) {
        x1 = (-b+sqrtf(delta))/2*a;
        x2 = (-b-sqrtf(delta))/2*a;
        [_x1Value setText:[[NSString alloc] initWithFormat:@"X1 = %.4f", x1]];
        [_x2VAlue setText:[[NSString alloc] initWithFormat:@"X2 = %.4f", x2]];
        [_valuesArray insertObject:[[NSString alloc] initWithFormat:@"X1:  %.2f        X2:  %.2f", x1,x2]atIndex:0];
        [_tableView reloadData];
        _aField.text = nil;
        _bField.text = nil;
        _cField.text = nil;
    }
    else{
        UIAlertView *fail = [[UIAlertView alloc] initWithTitle:@"No real number solution" message:@"Δ < 0" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [fail show];
    }
    [self.view endEditing:YES];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_valuesArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = [_valuesArray objectAtIndex:[indexPath row]];
    return cell;
}


@end
