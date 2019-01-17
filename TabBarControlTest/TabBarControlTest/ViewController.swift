//
//  ViewController.swift
//  TabBarControlTest
//
//  Created by VAM TEAM on 15/1/2019.
//  Copyright © 2019 chinasoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.green
        self.navigationItem.title  = NSLocalizedString("present", comment: "present")
        title = NSLocalizedString("present", comment: "present")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(backToPrevious))
    }

    @objc func backToPrevious(){
        dismiss(animated: true, completion: nil)
    }

}

