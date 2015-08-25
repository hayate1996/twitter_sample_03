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
        
        tweets = [  ["name": "Hiro", "description": "My name is AAA", "icon":"twitter_icon"],
                    ["name": "Account BBB", "description": "My name is BBB", "icon":"user_b_icon"],
                    ["name": "Account CCC", "description": "My name is CCC", "icon":"user_c_icon"],
                    ["name": "Account BBB", "description": "How old are you, CCC?", "icon":"user_b_icon"],
                    ["name": "Account CCC", "description": "My old is 17.", "icon":"user_c_icon"]]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
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
