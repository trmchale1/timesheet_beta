//
//  V2thingsDetailVCTableViewController.m
//  timesheet_beta
//
//  Created by Tim McHale on 6/26/14.
//  Copyright (c) 2014 Tim McHale. All rights reserved.
//

#import "V2thingsDetailVCTableViewController.h"
#import "things.h"

@interface V2thingsDetailVCTableViewController ()

@end

@implementation V2thingsDetailVCTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender
{
    NSLog(@"cancel");
    [self.delegate V2thingsDetailVCTableViewControllerDidCancel:self];
}

- (IBAction)done:(id)sender

{
    
    things *Things = [[things alloc] init];
    
    Things.name = self.nameTexy.text;
    NSLog(@"x = %@", Things.name);
    Things.game = self.gameText.text;
    NSLog(@"x = %@", Things.game);

    [self.delegate V2thingsDetailVCTableViewController:self didAddThing:Things];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        [self.nameTexy becomeFirstResponder];
        [self.gameText becomeFirstResponder];

    }
}


@end
