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
import Cartography

class LoginViewController: BasViewController {

    let labelName         = UILabel()
    let labelPassword     = UILabel()
    let nameTextFiled     = UITextField()

    let passwordTextFiled = UITextField()
    let loginBtn          = UIButton.buttonWithType(UIButtonType.System) as! UIButton

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        view.backgroundColor = UIColor.whiteColor()

        addNavigation("Login")

        addView()
        initView()
        remakeConstraints(labelName, view2name: nameTextFiled)
        remakeConstraints(labelPassword, view2name: passwordTextFiled)

        remakeConstraintsTop(labelName, view2name: nameTextFiled,
                superviewname: view, topoffset: 100)
        remakeConstraintsTop(labelPassword, view2name: passwordTextFiled,
                superviewname: labelName, topoffset: 50)
        loginButtonConstraints()

        loginBtn.addTarget(self, action: Selector("showLoginInfo:"),
                forControlEvents: UIControlEvents.TouchUpInside)


    }


    func addView() {
        self.view.addSubview(labelName)
        self.view.addSubview(labelPassword)

        self.view.addSubview(nameTextFiled)
        self.view.addSubview(passwordTextFiled)

        self.view.addSubview(loginBtn)
    }

    func initView() {
        labelName.textColor               = UIColor.blackColor()
        labelName.font                    = UIFont(name: "HelveticaNeue", size: 14.0)
        labelName.text                    = "Username: "
        labelName.textAlignment           = NSTextAlignment.Right

        labelPassword.textColor           = UIColor.blackColor()
        labelPassword.font                = UIFont(name: "HelveticaNeue", size: 14.0)
        labelPassword.text                = "Password: "
        labelPassword.textAlignment       = NSTextAlignment.Right

        nameTextFiled.borderStyle         = UITextBorderStyle.RoundedRect
        passwordTextFiled.borderStyle     = UITextBorderStyle.RoundedRect
        passwordTextFiled.secureTextEntry = true

        loginBtn.setTitle("Login", forState: UIControlState.Normal)
        loginBtn.titleLabel!.font = UIFont(name: "HelveticaNeue", size: 20.0)
    }

    func remakeConstraints(view1 : UIView, view2name view2 : UIView) {

        layout(view1, view2) { view1, view2 in

            view1.width == view1.superview!.width * 0.5 - 30
            view1.left == view1.superview!.left + 10
            view2.right == view2.superview!.right - 10
            distribute(by: 10, horizontally: view1, view2)

        }

    }

    func remakeConstraintsTop(view1 : UIView, view2name view2 : UIView,
                              superviewname view3 : UIView, #topoffset : Int) {

        view1.snp_remakeConstraints { (make) -> Void in
            make.top.equalTo(view3).offset(topoffset)
        }

        view2.snp_remakeConstraints { (make) -> Void in
            make.top.equalTo(view1.snp_top).offset(-5)
        }

    }

    func loginButtonConstraints() {
        loginBtn.snp_remakeConstraints { (make) -> Void in
            make.centerX.equalTo(view)
            make.top.equalTo(labelPassword.snp_bottom).offset(30)
        }

    }

    func showLoginInfo(sender:UIButton) {

        hideKeyboard()
        var text = nameTextFiled.text + " / " + passwordTextFiled.text
        SCLAlertView().showInfo("Login Info", subTitle: text)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        hideKeyboard()
    }

    override func callback() {
        hideKeyboard()
    }

    func hideKeyboard() {
        nameTextFiled.resignFirstResponder()
        passwordTextFiled.resignFirstResponder()
    }



}
