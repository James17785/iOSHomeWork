//
//  CommonSetting.swift
//  tableViewControllerFirst
//
//  Created by VAM TEAM on 12/1/2019.
//  Copyright © 2019 chinasoft. All rights reserved.
//

import UIKit

class CommonSetting: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //cell number
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return dataSource[section].1.count
    }
    
    //datum source cell table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "testCellID(indexPath.section)"
        var cell:NewTableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellID) as? NewTableViewCell
        if cell == nil {
            cell = NewTableViewCell(style: .default, reuseIdentifier: cellID)
        }
        let dict = dataSource[indexPath.section].1[indexPath.row]
        cell?.accessoryType = .disclosureIndicator
        cell?.userLabel?.text = dict.name
        cell?.iconImv.image = UIImage(named: dict.icon)
        
        return cell!
    }
    //UITableViewDelegete
    //height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74.0
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    //action
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    //section number
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    var dataSource = [
        ("section1",[(name:"钱包",icon:"icon1")]),
        ("section2",[(name:"收藏",icon:"icon2"),(name:"相册",icon:"icon3"),(name:"表情",icon:"icon4")]),
        ("section3",[(name:"设置",icon:"icon5")])]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: UIScreen.main.bounds, style: .grouped)
        self.title = "UserInfo"
        self.navigationItem.title = "UserInfo"
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        
        tableView.reloadData()
    }
}

