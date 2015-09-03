//
// Created by Simon Yang on 9/1/15.
// Copyright (c) 2015 Simon Yang. All rights reserved.
//

import UIKit
import SnapKit

class TestTableViewController: BasViewController, UITableViewDataSource, UISearchBarDelegate, UITableViewDelegate {

    var tableView: UITableView?
    var citys : [String] = ["北京", "厦门", "福州", "上海", "广州", "深圳", "重庆", "天津",
                 "哈尔滨", "佳木斯", "乌鲁木齐", "拉萨", "石家庄", "成都", "昆明", "武汉"]
    var searchData = [String]()
    var searchBar = UISearchBar()
    var isSearch = false

    override func viewDidLoad() {
        super.viewDidLoad()

        NSLog("TestTableViewController -> viewDidLoad")

        view.backgroundColor = UIColor.whiteColor()

        addNavigation("Table View")

        tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)

        self.view.addSubview(tableView!)

        tableView!.snp_remakeConstraints { (make) -> Void in
            make.size.equalTo(view).offset(CGSizeMake(0, -64))
            make.top.equalTo(navBar.snp_bottom)
        }

        tableView!.addPullToRefreshWithActionHandler {
            delay(2) {
                self.tableView!.pullToRefreshView.stopAnimating()
            }
        }

        var screenRect: CGRect = UIScreen.mainScreen().bounds
        searchBar.frame = CGRectMake(0, 0, screenRect.size.width, 44)

        tableView!.tableHeaderView = searchBar
        
        tableView!.dataSource = self
        searchBar.delegate    = self
        tableView!.delegate   = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if isSearch {
            return searchData.count
        } else {
            return citys.count
        }

    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cellId = "cell_id"

        var tableCell : UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("cellId") as? UITableViewCell

        if tableCell == nil {
            tableCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellId)
        }

        if isSearch {
            tableCell!.textLabel!.text = searchData[indexPath.row]
        } else {
            tableCell!.textLabel!.text = citys[indexPath.row]
        }

        return tableCell!
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar!) {

        isSearch = false
        tableView!.reloadData()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar!) {
        self.filterBySubstring(searchBar.text)
        searchBar.resignFirstResponder()
    }

    func searchBar(_ searchBar: UISearchBar!, textDidChange searchText: String!) {
        self.filterBySubstring(searchText)
    }

    func filterBySubstring(_ subStr: String) {
        isSearch = true
//        var pred = NSPredicate("SELF CONTAINS[c] %@", argumentArray: [subStr])

        searchData = citys.filter {
            if let s = $0 as? String {
                if subStr == "" {
                    return true
                }
                return s.componentsSeparatedByString(subStr).count > 1
            } else {
                return false
            }
        }

        tableView!.reloadData()
    }

    func scrollViewWillBeginDragging(scrollView: UIScrollView!) {
        searchBar.resignFirstResponder()
    }

}


