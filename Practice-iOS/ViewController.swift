//
//  ViewController.swift
//  Practice-iOS
//
//  Created by Simon Yang on 8/28/15.
//  Copyright (c) 2015 Simon Yang. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {


    let label1 = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        view.addSubview(label1)
        
        label1.textColor = UIColor.blackColor()
        label1.font = UIFont(name: "HelveticaNeue", size: 30.0)
        label1.text = "Hello World"
        label1.textAlignment = NSTextAlignment.Center
        
        label1.snp_remakeConstraints { (make) -> Void in
            make.width.equalTo(view)
            make.center.equalTo(view)
        }
        
//        label1.re

    }

//    func

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

