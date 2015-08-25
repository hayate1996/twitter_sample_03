//
//  ViewController.swift
//  twitter_sample
//
//  Created by NAGAMINE HIROMASA on 2015/08/16.
//  Copyright (c) 2015年 Hiromasa Nagamine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var loginButton: UIButton!
    var accountsList:[Dictionary<String,String>]?
    var tweets:[Dictionary<String, AnyObject>]?

    override func viewDidLoad() {
        super.viewDidLoad()

        accountsList = [["name":"Hiro"], ["name":"Account BBB"], ["name":"Account CCC"]]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func tappedLoginButton(sender: AnyObject) {
        var accountSelectionSheet = UIAlertController()
        accountSelectionSheet.title = "Select Account"

        let selectAction =  { (var action: UIAlertAction!) -> Void in
            self.performSegueWithIdentifier("segueTimelineViewController", sender: nil)
        }

        if let accounts:[Dictionary<String, String>] = accountsList{
            for account in accounts {
                let action = UIAlertAction(title: account["name"]!, style: .Default, handler: selectAction)
                accountSelectionSheet.addAction(action)
            }
        }

        let CanceledAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        accountSelectionSheet.addAction(CanceledAction)

        self.presentViewController(accountSelectionSheet, animated: true, completion: nil)
    }

}

