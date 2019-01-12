//
//  ViewController.swift
//  tableViewControllerFirst
//
//  Created by VAM TEAM on 9/1/2019.
//  Copyright © 2019 chinasoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    var tableView = UITableView()
    var dataArr = NSMutableArray()
    
    func numberOfSectionIntableView(tabletView: UITableView) -> Int{
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    //cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "cell";
        
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: cellID)
        
        cell.textLabel?.text = String(dataArr[indexPath.row] as! String)
        
        cell.detailTextLabel?.text = "test\(dataArr[indexPath.row])"
        
        return cell
    }
    //action
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "prompt", message: "this is cell", preferredStyle: UIAlertControllerStyle.alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    //action
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Delete") { (UITableViewRowAction, indexPath) in
            self.dataArr.removeObject(at: indexPath.row)
            
            tableView.reloadData()
        }
        return [deleteAction]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        dataArr = ["1","2","3","4","5","6","7","8","9","10"]
        
    
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height),style:UITableViewStyle.grouped)
        
        UITableView(frame: view.bounds, style: .grouped)
        
        
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        

    }


}

