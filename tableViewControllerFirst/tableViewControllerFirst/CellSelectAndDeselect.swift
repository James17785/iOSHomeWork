//
//  CellSelectAndDeselect.swift
//  tableViewControllerFirst
//
//  Created by VAM TEAM on 11/1/2019.
//  Copyright © 2019 chinasoft. All rights reserved.
//

import UIKit

class CellSelectAndDeselect: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var dataSource = [["微信","支付宝","银联"],["微信","支付宝","银联"]]
    var tableView:UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "addCell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "addCell")
            cell?.selectionStyle = .none
        }
        let arr = dataSource[indexPath.section]
        cell?.textLabel?.text = arr[indexPath.row] as String
        
        return cell!
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if indexPath.section == 1 {
            return .delete
        }
        return .insert
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        var arr = dataSource[indexPath.section] as Array
        if editingStyle == .insert {
            arr.insert("Apple pay", at: indexPath.row)
            dataSource[indexPath.section] = arr
            tableView.insertRows(at: [indexPath], with: .right)
        }else{
            arr.remove(at: indexPath.row)
            dataSource[indexPath.section] = arr
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "title"
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: CGRect(x: 0, y: 100, width: view.bounds.width, height: view.bounds.height), style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
       // var tableView = UITableView(frame: view.bounds, style: .grouped)
        self.title = "支付方式"
        view.backgroundColor = UIColor.white
        let rightBar = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addButtonClick))
        self.navigationItem.rightBarButtonItem = rightBar
        
//        let butItem = UIButton(frame: CGRect(x: 30, y: 20, width: 100, height: 100))
//        butItem.setTitle("button", for: .normal)
//        butItem.backgroundColor = UIColor.red
//        butItem.addTarget(self, action: #selector(addButtonClick), for: .touchUpInside)
//        view.addSubview(butItem)

    }
    @objc func addButtonClick() {
        self.setEditing(true, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
}
