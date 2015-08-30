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

    let label1 = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        view.addSubview(label1)

        label1.textColor = UIColor.blackColor()
        label1.font = UIFont(name: "HelveticaNeue", size: 30.0)
        label1.text = "Login Screen"
        label1.textAlignment = NSTextAlignment.Center

        label1.snp_remakeConstraints { (make) -> Void in
            make.width.equalTo(view)
            make.top.equalTo(view).offset(50)
        }


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
