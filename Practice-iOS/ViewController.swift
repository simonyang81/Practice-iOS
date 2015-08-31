//
//  ViewController.swift
//  Practice-iOS
//
//  Created by Simon Yang on 8/28/15.
//  Copyright (c) 2015 Simon Yang. All rights reserved.
//

import UIKit
import SnapKit
import SCLAlertView

class ViewController: UIViewController {

    let label1 = UILabel()
    let button1 = UIButton.buttonWithType(UIButtonType.System) as! UIButton
    let button2 = UIButton.buttonWithType(UIButtonType.System) as! UIButton

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        view.backgroundColor = UIColor.whiteColor()

        view.addSubview(label1)
        view.addSubview(button1)
        view.addSubview(button2)
        
        label1.textColor = UIColor.blackColor()
        label1.font = UIFont(name: "HelveticaNeue", size: 30.0)
        label1.text = "Hello World"
        label1.textAlignment = NSTextAlignment.Center
        
        label1.snp_remakeConstraints { (make) -> Void in
            make.width.equalTo(view)
            make.center.equalTo(view)
        }
        
        button1.setTitle("button1", forState: UIControlState.Normal)
        button2.setTitle("button2", forState: UIControlState.Normal)
        
//        button1.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//        button1.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)

        button1.snp_remakeConstraints { (make) -> Void in
            make.left.equalTo(view).offset(10)
            make.top.equalTo(view).offset(20)
        }

        button2.snp_remakeConstraints { (make) -> Void in
            make.top.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-10)

        }

        button1.addTarget(self, action: Selector("button1Handler:"),
                forControlEvents: UIControlEvents.TouchUpInside)

        button2.addTarget(self, action: Selector("gotoLoginScreen:"),
                forControlEvents: UIControlEvents.TouchUpInside)
        
    }


    func button1Handler(sender:UIButton) {
        SCLAlertView().showInfo("Important info", subTitle: "You are great")
    }

    func gotoLoginScreen(sender:UIButton) {
        let vc:LoginViewController = LoginViewController()
        self.presentViewController(vc, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

