//
//  TimelineViewController.swift
//  twitter_sample
//
//  Created by NAGAMINE HIROMASA on 2015/08/16.
//  Copyright (c) 2015年 Hiromasa Nagamine. All rights reserved.
//

import UIKit

class TimelineViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {

    let cellIdentifier = "tweetCell"
    var tweets:[Dictionary<String, AnyObject>]?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()

        tweets = [  ["name": "Account AAA", "description": "My name is AAA", "icon":"user_a_icon"],
                    ["name": "Account BBB", "description": "My name is BBB", "icon":"user_b_icon"],
                    ["name": "Account CCC", "description": "My name is CCC", "icon":"user_c_icon"],
                    ["name": "Account BBB", "description": "How old are you, CCC?", "icon":"user_b_icon"],
                    ["name": "Account CCC", "description": "My old is 17.", "icon":"user_c_icon"]]

//        var tweetCell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellIdentifier)
//        tableView.registerClass(tweetCell.dynamicType, forCellReuseIdentifier: cellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.

        if let tweetsList = tweets {
            return tweetsList.count
        }

        return 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var aCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as? UITableViewCell

        // Configure the cell...
        if aCell == nil {
            aCell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellIdentifier)
        }

        var cell = aCell!
        cell.imageView?.image = UIImage(named: (tweets![indexPath.row]["icon"] as? String)!)
        cell.textLabel?.text = tweets![indexPath.row]["description"] as? String
        cell.detailTextLabel?.text = tweets![indexPath.row]["name"] as? String

        return cell
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50.0
    }

}
