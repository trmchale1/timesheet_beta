//
//  V2ViewControllerTableViewController.m
//  timesheet_beta
//
//  Created by Tim McHale on 6/25/14.
//  Copyright (c) 2014 Tim McHale. All rights reserved.
//

#import "V2ViewControllerTableViewController.h"
#import "things.h"
#import "thingsCell.h"
#import "V2thingsDetailVCTableViewController.h"
#import "addInvoice.h"
@interface V2ViewControllerTableViewController ()

@end

@implementation V2ViewControllerTableViewController


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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.things count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    thingsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlayerCell"];
    
    things *thing = (self.things)[indexPath.row];
    cell.textLabel.text = thing.name;
   
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddThing"]) {
        
        UINavigationController *navigationController = segue.destinationViewController;
        V2thingsDetailVCTableViewController *view = [[navigationController viewControllers]  objectAtIndex:0];
        view.delegate = self;
    }
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    things *thing = (self.things)[indexPath.row];
    _name = thing.name;
    NSLog(@"z = %@", _name);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:_name forKey:@"cheese"];
        [defaults synchronize];
}



- (void)V2thingsDetailVCTableViewControllerDidCancel:(V2thingsDetailVCTableViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)V2thingsDetailVCTableViewController:(V2thingsDetailVCTableViewController *)controller didAddThing:(things *)Things
{
    [self.things addObject:Things];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:([self.things count] - 1) inSection:0];
  [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
