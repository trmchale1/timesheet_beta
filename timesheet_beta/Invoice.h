//
//  Invoice.h
//  timesheet_beta
//
//  Created by Tim McHale on 6/27/14.
//  Copyright (c) 2014 Tim McHale. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Invoice : NSObject

@property (nonatomic, copy) NSString *client;
@property (nonatomic, copy) NSString *rate;
@property (nonatomic, copy) NSString *hours;
@property (nonatomic, copy) NSString *tax;
@property (nonatomic, copy) NSString *total;
@property (nonatomic, copy) NSString *notes;




@end
