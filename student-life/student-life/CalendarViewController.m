//
//  CalendarViewController.m
//  student-life
//
//  Created by Jeffrey Xiong on 3/9/15.
//  Copyright (c) 2015 Jeffrey Xiong. All rights reserved.
//  API KEY: AIzaSyA8uiMqNYZFiBwMo-dVIr7ifnFcC00m-1I

#import "CalendarViewController.h"


@interface CalendarViewController ()

@property (nonatomic, weak) UIColor *oldTintColor;
@property (nonatomic, weak) UIColor *oldBarColor;

@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Visual Elements
    [self.navigationController setNavigationBarHidden:NO];
    CGFloat red = 104.0/255.0;
    CGFloat green = 143.0/255.0;
    CGFloat blue = 169.0/255.0;
    CGFloat alpha = 1.0;
    self.oldTintColor = self.navigationController.navigationBar.tintColor;
    self.oldBarColor = self.navigationController.navigationBar.barTintColor;
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:red green:green blue:blue alpha:alpha]];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];

    // Google API Call
    NSString *calendarCall = @"http://https://www.googleapis.com/calendar/v3/calendars/rice.edu_90aprbs5m5el9odenh43sff5hc%40group.calendar.google.com/events?key=AIzaSyA8uiMqNYZFiBwMo-dVIr7ifnFcC00m-1I";
    [self getCalendarRequest:calendarCall];

}

// Connection

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    _responseData = [[NSMutableData alloc] init];
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [_responseData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse *)cachedResponse {
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    CalendarEvent *event;
    NSError *e;
    NSDictionary *calendar = [NSJSONSerialization JSONObjectWithData:_responseData options:NSJSONReadingMutableContainers error:&e];
# if DEBUG
    NSLog(@"Object: %@", calendar);
# endif
    // Parse JSON, store in database.
    NSArray *eventList = [calendar valueForKey:@"items"];
    for (int i = 0; i < [eventList count]; i++) {
        event = [[CalendarEvent alloc] init];
        event.title = [eventList[i] valueForKey:@"summary"];
        event.startdate = [[eventList[i] valueForKey:@"start"] valueForKey:@"dateTime"];
        event.enddate = [[eventList[i] valueForKey:@"end"] valueForKey:@"dateTime"];
        event.location = [eventList[i] valueForKey:@"location"];
        
        NSString *query = [NSString stringWithFormat:@"insert into eventInfo values('%@', '%@', '%@', '%@'])", event.title, event.startdate, event.enddate, event.location];
        [self.dbManager executeQuery:query];
        if (self.dbManager.affectedRows != 0) {
            NSLog(@"Query was executed successfully.");
        } else {
            NSLog(@"Query was not executed.");
        }
    }
    
    // Loading animation
}


- (void)getCalendarRequest:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    NSLog(@"%@", conn);
}


- (void)viewDidAppear:(BOOL)animated{
    
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
    
    //Get calendars based on default calendar ids:
    //Student Events id: rice.edu_90aprbs5m5el9odenh43sff5hc@group.calendar.google.com
    
    //RPC id: riceprogramcouncil@gmail.com
}


- (void)viewWillDisappear:(BOOL)animated{
    [self.navigationController.navigationBar setTintColor:self.oldTintColor];
    [self.navigationController.navigationBar setBarTintColor:self.oldBarColor];
    [super viewWillDisappear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
