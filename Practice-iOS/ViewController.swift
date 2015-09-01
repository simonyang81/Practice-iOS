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

    var buttonArrays = [UIButton]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.


        for (var i=0; i<3; i++) {
            var btn : UIButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
            buttonArrays.append(btn)
        }

        view.backgroundColor = UIColor.whiteColor()

        view.addSubview(label1)

        for btn in buttonArrays {
            view.addSubview(btn)
        }

        label1.textColor = UIColor.blackColor()
        label1.font = UIFont(name: "HelveticaNeue", size: 30.0)
        label1.text = "Hello World"
        label1.textAlignment = NSTextAlignment.Center
        
        label1.snp_remakeConstraints { (make) -> Void in
            make.width.equalTo(view)
            make.center.equalTo(view)
        }

        for (var i=0; i<buttonArrays.count; i++) {
            buttonArrays[i].setTitle("button\(i)", forState: UIControlState.Normal)
            buttonArrays[i].titleLabel!.font = UIFont(name: "HelveticaNeue", size: 16.0)
        }


//        button1.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
//        button1.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)

        buttonArrays[0].snp_remakeConstraints { (make) -> Void in
            make.left.equalTo(view).offset(10)
            make.top.equalTo(view).offset(20)
        }

        buttonArrays[1].snp_remakeConstraints { (make) -> Void in
            make.top.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-10)
        }

        buttonArrays[2].snp_remakeConstraints { (make) -> Void in
            make.top.equalTo(view).offset(100)
            make.centerX.equalTo(view)
        }

        buttonArrays[0].addTarget(self, action: Selector("button1Handler:"),
                forControlEvents: UIControlEvents.TouchUpInside)

        buttonArrays[1].addTarget(self, action: Selector("gotoLoginScreen:"),
                forControlEvents: UIControlEvents.TouchUpInside)

        buttonArrays[2].addTarget(self, action: Selector("gotoTableView:"),
                forControlEvents: UIControlEvents.TouchUpInside)
    }


    func button1Handler(sender:UIButton) {
        SCLAlertView().showInfo("Important info", subTitle: "You are great")
    }

    func gotoLoginScreen(sender:UIButton) {
        let vc:LoginViewController = LoginViewController()
        self.presentViewController(vc, animated: true, completion: nil)
    }

    func gotoTableView(sender:UIButton) {
        let vc = TestTableViewController();
        self.presentViewController(vc, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

