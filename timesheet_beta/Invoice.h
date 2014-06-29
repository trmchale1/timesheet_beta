//
//  Invoice.h
//  timesheet_beta
//
//  Created by Tim McHale on 6/27/14.
//  Copyright (c) 2014 Tim McHale. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Invoice : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSString *rate;
@property (nonatomic) NSString *hours;
@property (nonatomic) NSString *tax;
@property (nonatomic) NSString *total;
@property (nonatomic) NSString *email;




@end
