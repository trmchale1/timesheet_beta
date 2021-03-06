//
//  V2thingsDetailVCTableViewController.h
//  timesheet_beta
//
//  Created by Tim McHale on 6/26/14.
//  Copyright (c) 2014 Tim McHale. All rights reserved.
//

#import <UIKit/UIKit.h>

@class V2thingsDetailVCTableViewController;
@class things;

@protocol V2thingsDetailVCTableViewControllerDelegate <NSObject>
- (void)V2thingsDetailVCTableViewControllerDidCancel:(V2thingsDetailVCTableViewController *)controller;
- (void)V2thingsDetailVCTableViewController:(V2thingsDetailVCTableViewController *)controller didAddThing:(things *)Things;
@end

@interface  V2thingsDetailVCTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTexy;
@property (weak, nonatomic) IBOutlet UITextField *gameText;

@property (nonatomic, weak) id <V2thingsDetailVCTableViewControllerDelegate> delegate;

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

@end