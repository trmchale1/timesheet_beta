//
//  finalInvoice.m
//  timesheet_beta
//
//  Created by Tim McHale on 6/28/14.
//  Copyright (c) 2014 Tim McHale. All rights reserved.
//

#import "finalInvoice.h"
#import "Invoice.h"
@interface finalInvoice ()

@end

@implementation finalInvoice

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
    NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
    NSString *client = [defaults1 objectForKey:@"invoiceEmail"];
    
    NSUserDefaults *defaults2 = [NSUserDefaults standardUserDefaults];
    NSString *rate = [defaults2 objectForKey:@"invoiceEmail2"];
    
    NSUserDefaults *defaults3 = [NSUserDefaults standardUserDefaults];
    NSString *hours = [defaults3 objectForKey:@"invoiceEmail3"];
    
    NSUserDefaults *defaults4 = [NSUserDefaults standardUserDefaults];
    NSString *tax = [defaults4 objectForKey:@"invoiceEmail4"];

    NSUserDefaults *defaults5 = [NSUserDefaults standardUserDefaults];
    NSString *total = [defaults5 objectForKey:@"invoiceEmail5"];
    
    NSUserDefaults *defaults6 = [NSUserDefaults standardUserDefaults];
    NSString *email = [defaults6 objectForKey:@"invoiceEmail6"];
    
    NSLog(@"email = %@", email);
   
    _clientLabel.text = client;
    _rateLabel.text = rate;
    _hoursLabel.text = hours;
    _taxLabel.text = tax;
    _totalLabel.text = total;
    _emailLabel.text = email;
    
    //    NSLog(@"%@", finalInvoice);
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


- (IBAction)email_invoice:(id)sender {
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        
        mailer.mailComposeDelegate = self;
        
        NSString *subject = @"Invoice from Tim";
        
        [mailer setSubject:subject];
        
        
        NSUserDefaults *defaults1 = [NSUserDefaults standardUserDefaults];
        NSString *client_email = [defaults1 objectForKey:@"invoiceEmail"];
        
        NSUserDefaults *defaults2 = [NSUserDefaults standardUserDefaults];
        NSString *rate_email = [defaults2 objectForKey:@"invoiceEmail2"];
        
        NSUserDefaults *defaults3 = [NSUserDefaults standardUserDefaults];
        NSString *hours_email = [defaults3 objectForKey:@"invoiceEmail3"];
        
        NSUserDefaults *defaults4 = [NSUserDefaults standardUserDefaults];
        NSString *tax_email = [defaults4 objectForKey:@"invoiceEmail4"];
        
        NSUserDefaults *defaults5 = [NSUserDefaults standardUserDefaults];
        NSString *total_email = [defaults5 objectForKey:@"invoiceEmail5"];
        
        NSUserDefaults *defaults6 = [NSUserDefaults standardUserDefaults];
        NSString *emailEmail = [defaults6 objectForKey:@"invoiceEmail6"];
    
        NSUserDefaults *defaults7 = [NSUserDefaults standardUserDefaults];
        NSString *user_name = [defaults7 objectForKey:@"user_name"];
        
        NSUserDefaults *defaults8 = [NSUserDefaults standardUserDefaults];
        NSString *user_email = [defaults8 objectForKey:@"user_email"];
        
        NSUserDefaults *defaults9 = [NSUserDefaults standardUserDefaults];
        NSString *user_address = [defaults9 objectForKey:@"user_address"];
        
        NSUserDefaults *defaults10 = [NSUserDefaults standardUserDefaults];
        NSString *user_city = [defaults10 objectForKey:@"user_city"];
        
        NSUserDefaults *defaults11 = [NSUserDefaults standardUserDefaults];
        NSString *user_state = [defaults11 objectForKey:@"user_state"];
        
       
        
        NSArray *toRecipients = [NSArray arrayWithObjects:emailEmail, user_email, nil];
        [mailer setToRecipients:toRecipients];
        
        
        NSString *emailBody = [NSString stringWithFormat:@"<h4><center>Invoice</center></h4><p><center>%@<br>%@<br>%@<br>%@</center></p><p>To %@:<br>%@ hours worked x $%@ an hour = Total: $%@</p>", user_name, user_address, user_city, user_state, client_email, hours_email, rate_email, total_email];
        [mailer setMessageBody:emailBody isHTML:YES];
        
        [self presentModalViewController:mailer animated:YES];
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure"
                                                        message:@"Your device doesn't support the composer sheet"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];

}
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled: you cancelled the operation and no email message was queued.");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved: you saved the email message in the drafts folder.");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail send: the email message is queued in the outbox. It is ready to send.");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed: the email message was not saved or queued, possibly due to an error.");
            break;
        default:
            NSLog(@"Mail not sent.");
            break;
    }
    
    // Remove the mail view
    [self dismissModalViewControllerAnimated:YES];
}


@end
