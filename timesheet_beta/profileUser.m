//
//  profileUser.m
//  timesheet_beta
//
//  Created by Tim McHale on 6/29/14.
//  Copyright (c) 2014 Tim McHale. All rights reserved.
//

#import "profileUser.h"

@interface profileUser ()

@end

@implementation profileUser

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:gestureRecognizer];
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    [defaults setObject:voice.name forKey:@"invoiceEmail"];
//    
//    NSUserDefaults *x = [NSUserDefaults standardUserDefaults];
//    [x setObject:voice.rate forKey:@"invoiceEmail2"];
//    
//    NSUserDefaults *z = [NSUserDefaults standardUserDefaults];
//    [z setObject:voice.hours forKey:@"invoiceEmail3"];
//    
//    NSUserDefaults *a = [NSUserDefaults standardUserDefaults];
//    [a setObject:voice.tax forKey:@"invoiceEmail4"];
//    
//    NSUserDefaults *b = [NSUserDefaults standardUserDefaults];
//    [b setObject:voice.total forKey:@"invoiceEmail5"];
//    
//    NSUserDefaults *c = [NSUserDefaults standardUserDefaults];
//    [c setObject:voice.email forKey:@"invoiceEmail6"];
//
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) hideKeyboard {
    [_stateField resignFirstResponder];
    [_cityField resignFirstResponder];
    [_nameField resignFirstResponder];
    [_addressField resignFirstResponder];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveUser:(id)sender {
    NSLog(@"name = %@", _nameField.text);
    NSLog(@"address = %@", _addressField.text);
    NSLog(@"city = %@", _cityField.text);
    NSLog(@"State =%@", _stateField.text);
    
    NSString *name = _nameField.text;
    NSString *address = _addressField.text;
    NSString *city = _cityField.text;
    NSString *state = _stateField.text;

    
    
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
       [defaults setObject:name forKey:@"user_name"];
    
    
    
        NSUserDefaults *z = [NSUserDefaults standardUserDefaults];
        [z setObject:address forKey:@"user_address"];
    
        NSUserDefaults *a = [NSUserDefaults standardUserDefaults];
        [a setObject:city forKey:@"user_city"];
    
        NSUserDefaults *b = [NSUserDefaults standardUserDefaults];
        [b setObject:state forKey:@"user_state"];
    //
    //    NSUserDefaults *c = [NSUserDefaults standardUserDefaults];
    //    [c setObject:voice.email forKey:@"invoiceEmail6"];
    
    
}
@end
