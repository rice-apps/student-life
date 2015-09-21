//
//  CalendarViewController.swift
//  Rice Mobile
//
//  Created by Jeffrey Xiong on 9/13/15.
//  Copyright (c) 2015 Jeffrey Xiong. All rights reserved.
//


import Foundation
import UIKit
import CoreData

class CalendarTableViewController : UITableViewController {
    
    // initialize array of calendars
    var calendarArray: [[String:String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var calendarLinkArray: [String] = ["rice.edu_90aprbs5m5el9odenh43sff5hc%40group.calendar.google.com"]
        
//        for link in calendarLinkArray {
//            var call : String = "https://www.googleapis.com/calendar/v3/calendars/" + link + "/events?key=AIzaSyB2odfmCmGT9KwJZv4ImL0OvcM-zOKQFYM"
//            var request = NSURLRequest(URL: NSURL(string: call)!)
//            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue(), completionHandler:{
//                (response:NSURLResponse?, data: NSData?, error: NSError?) -> Void in
//                // completion handling
//                // error
//                if let e = error {
//                    print("Error calling GET on calendar request")
//                } else {
//                    var jsonError : NSError?
//                    // parse JSON
//                    let calendar : [String:String] = NSJSONSerialization.JSONObjectWithData(data, options: []) as Dictionary
//                    
//                    // calendar
//                    if let j = jsonError {
//                        print("Error parsing JSON to dictionary")
//                    } else {
//                        print("JSON parsing successful")
//                        self.calendarArray.append(calendar)
//                        print(calendar, terminator: "")
//                    }
//                    
//                }
//                
//                
//                
//            })
//        }
        
    }
    
    
    
    
    
    
    
    
    
    
}



