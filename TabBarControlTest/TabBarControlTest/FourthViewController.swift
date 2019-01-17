//
//  FourthViewController.swift
//  TabBarControlTest
//
//  Created by VAM TEAM on 16/1/2019.
//  Copyright © 2019 chinasoft. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
        
        let button = UIButton(frame: CGRect(x: 10, y: 20, width: 100, height: 50))
        button.setTitle(NSLocalizedString("back", comment: ""), for: .normal)
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(backToPrevious), for: .touchUpInside)
        view.addSubview(button)
       
    }

    
    @objc func backToPrevious(){
        dismiss(animated: true, completion: nil)
    }
}
