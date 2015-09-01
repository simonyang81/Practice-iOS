//
// Created by Simon Yang on 9/1/15.
// Copyright (c) 2015 Simon Yang. All rights reserved.
//

import UIKit
import SnapKit

class TestTableViewController: BasViewController, UITableViewDataSource {

    var tableView: UITableView?
    let citys = ["北京", "厦门", "福州", "上海", "广州", "深圳", "重庆", "天津", "哈尔滨", "佳木斯", "乌鲁木齐", "拉萨", "石家庄", "成都", "昆明", "武汉"]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.whiteColor()

        addNavigation("Table View")

        tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        self.tableView!.dataSource = self
        self.view.addSubview(tableView!)

        tableView!.snp_remakeConstraints { (make) -> Void in
            make.top.equalTo(view.snp_top).offset(64)
            make.bottom.equalTo(view.snp_bottom)
            make.size.equalTo(view)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citys.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cellId = "cell_id"

        var tableCell : UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("cellId") as? UITableViewCell

        if tableCell == nil {
            tableCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellId)
        }

        tableCell!.textLabel!.text = citys[indexPath.row]

        return tableCell!
    }


}


