//
//  FacilitiesTableViewController.m
//  student-life
//
//  Created by James Hoke Peacock IV on 4/12/15.
//  Copyright (c) 2015 Jeffrey Xiong. All rights reserved.
//

#import "FacilitiesTableViewController.h"

@interface FacilitiesTableViewController ()

@end

@implementation FacilitiesTableViewController


NSArray *itemsArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;


    
    // Do any additional setup after loading the view, typically from a nib.
    
    NSDictionary *itemOne = @{ @"name" : @"Recreation Center", @"id" : @1};
    NSDictionary *itemTwo = @{ @"name" : @"Mudd Lab", @"id" : @2};
    NSDictionary *itemThree = @{ @"name" : @"Fondren Library", @"id" : @3};
    NSDictionary *itemFour = @{ @"name" : @"RUPD Station", @"id" : @4};
    NSDictionary *itemFive = @{ @"name" : @"RMC", @"id" : @5};
    NSDictionary *itemSix = @{ @"name" : @"Allen Center", @"id" : @6};
    NSDictionary *itemSeven = @{ @"name" : @"Post Office", @"id" : @7};
    
    itemsArray = [[NSMutableArray alloc] initWithObjects:itemOne, itemTwo,
                  itemThree, itemFour, itemFive, itemSix, itemSeven, nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [itemsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    NSDictionary *item =[itemsArray objectAtIndex:[indexPath row]];
    cell.textLabel.text = [item objectForKey:@"name"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Row tapped at %i", [indexPath row]);
}


//need this prepareforsegue function to pass data to the next view controller to display images of the facilities
//as well as hours and links to websites.
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/



@end
