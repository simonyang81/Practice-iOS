//
// Created by Simon Yang on 9/1/15.
// Copyright (c) 2015 Simon Yang. All rights reserved.
//

import UIKit

class BasViewController : UIViewController {

    internal let navBar              = UINavigationBar()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    internal func addNavigation(title:String) {

        var screenRect : CGRect = UIScreen.mainScreen().bounds

        navBar.frame = CGRectMake(0, 0, screenRect.size.width, 64)
        var navItems = UINavigationItem(title: title)
        var leftBar = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain,
                target: self, action: Selector("backMainViewController:"))
        navBar.pushNavigationItem(navItems, animated: true)
        navItems.setLeftBarButtonItem(leftBar, animated: true)

        view.addSubview(navBar)

    }

    internal func backMainViewController(sender:UIButton) {
        callback()
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    func callback() {
    }


}
