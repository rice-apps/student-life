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

@property (nonatomic, strong) NSMutableArray *calendarEventArray;
@property (nonatomic, weak) NSArray *calendarURLArray;
@property (nonatomic, weak) NSMutableArray *calendarIDArray;


@property (nonatomic, weak) NSString *currentCall;

-(NSString *)appendQuote:(NSString *)value;

@end


