//
//  LoginViewController.swift
//  Practice-iOS
//
//  Created by Simon Yang on 8/30/15.
//  Copyright (c) 2015 Simon Yang. All rights reserved.
//

import UIKit
import SnapKit
import SCLAlertView

class LoginViewController: UIViewController {

//    let label1 = UILabel()
//    let backBtn = UIButton.buttonWithType(UIButtonType.System) as! UIButton

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        view.backgroundColor = UIColor.whiteColor()

        addNavigation()

    }

    func addNavigation() {

        var screenRect : CGRect = UIScreen.mainScreen().bounds

        var navBar = UINavigationBar()
        navBar.frame = CGRectMake(0, 0, screenRect.size.width, 64)
        var navItems = UINavigationItem(title: "Login")
        var leftBar = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Bordered,
                target: self, action: Selector("backMainViewController:"))
        navBar.pushNavigationItem(navItems, animated: true)
        navItems.setLeftBarButtonItem(leftBar, animated: true)

        view.addSubview(navBar)

    }

    func backMainViewController(sender:UIButton) {

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
