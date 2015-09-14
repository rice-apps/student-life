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

class CalendarTableViewController:UITableViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var calendarLinkArray: [String] = ["rice.edu_90aprbs5m5el9odenh43sff5hc%40group.calendar.google.com"]
        
        for link in calendarLinkArray {
            var request = NSURLRequest(URL: NSURL(string: link)!)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue(), completionHandler:{
                (response:NSURLResponse!, data: NSData!, error: NSError!) -> Void in
                // completion handling
                // error
                if let e = error {
                    println("Error calling GET on calendar request")
                } else {
                    var jsonError : NSError?
                    // parse JSON
                    let calendar = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as! NSDictionary
                    
                    // calendar
                    if let j = jsonError {
                        println("Error parsing json result")
                    }
                    
                }
                
                
                
            })
        }
        
    }
    
    
    
    
    
    
    
    
    
    
}



