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
    
    // Database Init
    self.dbManager = [[CalendarDBManager alloc] initWithDatabaseFilename:@"calendardb.sql"];
    
    // Google API Call
    self.calendarURLArray = [NSArray arrayWithObjects:@"rice.edu_90aprbs5m5el9odenh43sff5hc@group.calendar.google.com", nil];
    
    for (int i = 0; i < [self.calendarURLArray count]; i++) {
        self.currentCall = self.calendarURLArray[i];
        NSString *calendarCall = [NSString stringWithFormat:@"https://www.googleapis.com/calendar/v3/calendars/%@%@", self.currentCall, @"/events?key=AIzaSyB2odfmCmGT9KwJZv4ImL0OvcM-zOKQFYM"];
        NSURL *url = [NSURL URLWithString:calendarCall];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:30];
        NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        NSLog(@"%@", conn);
        NSLog(@"%@", _responseData);
    }
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
    NSLog(@"loaded");
    CalendarEvent *event;
    NSError *e;
    NSDictionary *calendar = [NSJSONSerialization JSONObjectWithData:_responseData options:NSJSONReadingMutableContainers error:&e];
# if DEBUG
//    NSLog(@"Object: %@", calendar);
# endif
    
    // Replace old database
    NSString *deleteQuery = [NSString stringWithFormat:@"delete from eventInfo"];
    [self.dbManager executeQuery:deleteQuery];
    
    // Parse JSON, store in database.
    NSArray *eventList = [calendar valueForKey:@"items"];
    for (int i = 0; i < [eventList count]; i++) {
        event = [[CalendarEvent alloc] init];
        event.title = [self appendQuote:[eventList[i] valueForKey:@"summary"]];
        event.startdate = [self appendQuote:[[eventList[i] valueForKey:@"start"] valueForKey:@"dateTime"]];
        event.enddate = [self appendQuote:[[eventList[i] valueForKey:@"end"] valueForKey:@"dateTime"]];
        event.location = [self appendQuote:[eventList[i] valueForKey:@"location"]];
        event.eventID = [self appendQuote:[eventList[i] valueForKey:@"id"]];

        // Write to database
        NSString *writeQuery = [NSString stringWithFormat:@"insert into eventInfo values(null, '%@', '%@', '%@', '%@', '%@', '%@')", event.title, event.startdate, event.enddate, event.location, self.currentCall, event.eventID];
        [self.dbManager executeQuery:writeQuery];
        
        if (self.dbManager.affectedRows != 0) {
            NSLog(@"Query was executed successfully.");
        } else {
            NSLog(@"Query was not executed.");
        }
        
    }
    // Read from database
    NSString *readQuery = [NSString stringWithFormat:@"select * from eventInfo order by startdate desc"];
    self.calendarEventArray = [NSMutableArray arrayWithArray:[self.dbManager loadDataFromDB:readQuery]];
    NSLog(@"%@", self.calendarEventArray);
    // Update data
    [self.tableView reloadData];

    // Loading animation
}
// TODO: Connection fails
- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
    // Read from database
    NSString *readQuery = [NSString stringWithFormat:@"select * from eventInfo order by startdate desc"];
    self.calendarEventArray = [NSMutableArray arrayWithArray:[self.dbManager loadDataFromDB:readQuery]];
    NSLog(@"%@", self.calendarEventArray);
    // Update data
    [self.tableView reloadData];
    
}

- (NSString *)appendQuote:(NSString *)value{
    
    NSString * new = [value stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
    return new;
    
}

#pragma mark - Table view data source

// Table Code
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
//    NSLog(@"AHHHHH %d", [self.calendarEventArray count]);
    return [self.calendarEventArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    NSDictionary *item =[self.calendarEventArray objectAtIndex:[indexPath row]];
    cell.textLabel.text = [item objectForKey:@"title"];
    return cell;
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
