//
//  EventsTableViewController.swift
//  CommitteeTV
//
//  Created by Max Rogers on 8/30/16.
//  Copyright © 2016 Max Rogers. All rights reserved.
//

import UIKit

class EventsTableViewController: UITableViewController {
    let dataManager = DataManager.sharedInstance
    override func viewDidLoad() {
        dataManager.updateEvents { 
            self.tableView.reloadData()
        }
    }
}

//UITableViewDelegate
extension EventsTableViewController {
    //todo
}

//UITableViewDataSource
extension EventsTableViewController {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.events?.count ?? 0
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = dataManager.events?[indexPath.row].summary
        return cell
    }
}