//
//  FacilitiesTableViewController.swift
//  Rice Mobile
//
//  Created by Evangeline Liu on 9/7/15.
//  Copyright (c) 2015 Jeffrey Xiong. All rights reserved.
//

import Foundation
import UIKit

var itemsArray = [[String:Any]]()

class FacilitiesTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemsArray = [
            ["name" : "Recreation Center", "id" : 1],
            ["name" : "Mudd Lab", "id" : 2],
            ["name" : "Fondren Library", "id" : 3],
            ["name" : "RUPD Station", "id" : 4],
            ["name" : "RMC", "id" : 5],
            ["name" : "Allen Center", "id" : 6],
            ["name" : "Post Office", "id" : 7],
        ]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell
        var item : Dictionary<String,Any> = itemsArray[indexPath.row] as Dictionary
        cell.textLabel?.text = item["name"] as? String
        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Row tapped at", indexPath.row)
    }
}