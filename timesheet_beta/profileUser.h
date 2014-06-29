//
//  profileUser.h
//  timesheet_beta
//
//  Created by Tim McHale on 6/29/14.
//  Copyright (c) 2014 Tim McHale. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface profileUser : UIViewController <UITextFieldDelegate>
{
    UITapGestureRecognizer *gestureRecognizer;
}
@property (weak, nonatomic) IBOutlet UITextField *nameField;
- (IBAction)saveUser:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *addressField;
@property (weak, nonatomic) IBOutlet UITextField *cityField;
@property (weak, nonatomic) IBOutlet UITextField *stateField;
@property (nonatomic,retain) UITapGestureRecognizer *gestureRecognizer; 
@end
