//
//  addInvoice.m
//  timesheet_beta
//
//  Created by Tim McHale on 6/27/14.
//  Copyright (c) 2014 Tim McHale. All rights reserved.
//

#import "addInvoice.h"
#import "V2ViewControllerTableViewController.h"
#import "things.h"
#import "Invoice.h"
#import "finalInvoice.h"
@interface addInvoice ()

@end

@implementation addInvoice

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
         NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
   NSString *x = [defaults objectForKey:@"cheese"];
    NSLog(@"cheese = %@", x);
    
    self.nameLabel.text = x;

    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:gestureRecognizer];
    
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void) hideKeyboard {
    [_rate resignFirstResponder];
    [_hours resignFirstResponder];
    [_email resignFirstResponder];
    [_tax resignFirstResponder];

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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


- (IBAction)cancel:(id)sender {
               [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)save:(id)sender {
    
   

    NSString *rateTxt = [_rate text];
    NSString *hoursTxt = [_hours text];
    NSString *taxRate = [_tax text];
    NSString *emailTxt = [_email text];
    int rate = [rateTxt intValue];
    int hours = [hoursTxt intValue];
    int tax = [taxRate intValue];
    
    int pretax_total = rate * hours;
    
    float tax_rate_maker = .01;
    float tax_rate = tax * tax_rate_maker;
    NSLog(@"tax rate = %f", tax_rate);
    
    float tax_total = pretax_total *tax_rate;
    int total = pretax_total + tax_total;
    NSLog(@"total %i", total);
    NSString *totalTxt = [NSString stringWithFormat:@"%d", total];
  

    NSLog(@"rateTxt %@", rateTxt);
    NSLog(@"hoursTxt %@", hoursTxt);
    NSLog(@"taxRate %@", taxRate);

    
    Invoice *voice = [[Invoice alloc] init];
    voice.name = self.nameLabel.text;
    voice.rate = rateTxt;
    voice.hours = hoursTxt;
    voice.tax = taxRate;
    voice.total = totalTxt;
    voice.email = emailTxt;
    
    NSLog(@"name = %@", voice.name);
    NSLog(@"rate = %i", voice.rate);
    NSLog(@"total = %i", voice.total);
    NSLog(@"tax = %i", voice.tax);
    NSLog(@"email = %@", voice.email);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:voice.name forKey:@"invoiceEmail"];
    
    NSUserDefaults *x = [NSUserDefaults standardUserDefaults];
    [x setObject:voice.rate forKey:@"invoiceEmail2"];
    
    NSUserDefaults *z = [NSUserDefaults standardUserDefaults];
    [z setObject:voice.hours forKey:@"invoiceEmail3"];
    
    NSUserDefaults *a = [NSUserDefaults standardUserDefaults];
    [a setObject:voice.tax forKey:@"invoiceEmail4"];

    NSUserDefaults *b = [NSUserDefaults standardUserDefaults];
    [b setObject:voice.total forKey:@"invoiceEmail5"];
    
    NSUserDefaults *c = [NSUserDefaults standardUserDefaults];
    [c setObject:voice.email forKey:@"invoiceEmail6"];


}

@end
