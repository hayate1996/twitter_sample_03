//
//  ViewController.swift
//  twitter_sample
//
//  Created by NAGAMINE HIROMASA on 2015/08/16.
//  Copyright (c) 2015年 Hiromasa Nagamine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    let accountsList:[Dictionary<String,String>] = [["name":"Account AAA"], ["name":"Account BBB"], ["name":"Account CCC"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tappedLoginButton(sender: AnyObject) {
        var accountSelectionSheet = UIAlertController()
        accountSelectionSheet.title = "Select Account"

        let selectAction =  { (var action: UIAlertAction!) -> Void in
            self.performSegueWithIdentifier("segueTimelineViewController", sender: nil)
        }

        for account in accountsList as [Dictionary<String, String>] {
            let action = UIAlertAction(title: account["name"]!, style: .Default, handler: selectAction)
            accountSelectionSheet.addAction(action)
        }

        let CanceledAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        accountSelectionSheet.addAction(CanceledAction)

        self.presentViewController(accountSelectionSheet, animated: true, completion: nil)
    }

}

