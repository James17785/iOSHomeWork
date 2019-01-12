//
//  TableView1.swift
//  tableViewControllerFirst
//
//  Created by VAM TEAM on 10/1/2019.
//  Copyright © 2019 chinasoft. All rights reserved.
//

import Foundation
import UIKit

class TableView1: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //cell number
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    //datum source cell table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "testCellID"
        var cell:NewTableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellID) as? NewTableViewCell
        if cell == nil {
            cell = NewTableViewCell(style: .default, reuseIdentifier: cellID)
        }
        let dict:Dictionary = dataSource[indexPath.row]
        //cell?.accessoryType = UITableViewCell.Accesso
        cell?.userLabel?.text = dict["name"]
       // cell?.sexLabel.text = dict["sex"]
        //cell?.birthdayLable.text = dict["birthday"]
        //cell?.detailTextLabel?.text = "This is details"
        cell?.iconImv.image = UIImage(named: dict["icon"]!)
        cell?.accessoryType = .disclosureIndicator
        
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
        return 3
    }
    var dataSource = [[String:String]()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.backgroundColor = UIColor.white
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        dataSource = [
            ["name":"钱包","icon":"icon1"],
            ["name":"收藏","icon":"icon2"],
            ["name":"相册","icon":"icon3"],
            ["name":"表情","icon":"icon4"],
            ["name":"设置","icon":"icon5"]]
        
        tableView.reloadData()
    }
}
