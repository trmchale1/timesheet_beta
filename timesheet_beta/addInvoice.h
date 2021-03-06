//
//  addInvoice.h
//  timesheet_beta
//
//  Created by Tim McHale on 6/27/14.
//  Copyright (c) 2014 Tim McHale. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "V2ViewControllerTableViewController.h"


@interface  addInvoice : UITableViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;

- (IBAction)done:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *rate;
@property (weak, nonatomic) IBOutlet UITextField *hours;
@property (weak, nonatomic) IBOutlet UITextField *tax;
@property (weak, nonatomic) NSString *name;
@property (weak, nonatomic) IBOutlet UITextField *email;

@end
