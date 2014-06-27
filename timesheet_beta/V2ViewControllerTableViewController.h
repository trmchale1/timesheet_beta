//
//  V2ViewControllerTableViewController.h
//  timesheet_beta
//
//  Created by Tim McHale on 6/25/14.
//  Copyright (c) 2014 Tim McHale. All rights reserved.
//

#import <UIKit/UIKit.h>



#import "V2thingsDetailVCTableViewController.h"
#import "addInvoice.h"
@interface V2ViewControllerTableViewController : UITableViewController <V2thingsDetailVCTableViewControllerDelegate>


@property (nonatomic) NSString *name;

@property (nonatomic, strong) NSMutableArray *things;
@end
