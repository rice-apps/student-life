//
//  CalendarViewController.h
//  student-life
//
//  Created by Jeffrey Xiong on 3/9/15.
//  Copyright (c) 2015 Jeffrey Xiong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalendarDBManager.h"
#import "CalendarEvent.h"

@interface CalendarViewController : UITableViewController<NSURLConnectionDelegate>
{
    NSMutableData *_responseData;
}

@property (nonatomic, strong) CalendarDBManager *dbManager;

@end
