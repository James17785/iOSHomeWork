//
//  File.swift
//  tableViewControllerFirst
//
//  Created by VAM TEAM on 11/1/2019.
//  Copyright © 2019 chinasoft. All rights reserved.
//

import UIKit

class NewTableViewCell: UITableViewCell {
    let width:CGFloat = UIScreen.main.bounds.width
    var userLabel:UILabel!
    var birthdayLable:UILabel!
    var sexLabel:UILabel!
    var iconImv:UIImageView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //photo
        iconImv = UIImageView(frame: CGRect(x: 20, y: 15, width: 44, height: 44))
        iconImv.layer.masksToBounds = true
        iconImv.layer.cornerRadius = 22.0
        
        //name
        userLabel = UILabel(frame: CGRect(x: 74, y: 15, width: 70, height: 44))
        userLabel.textColor = UIColor.black
        userLabel.font = UIFont.boldSystemFont(ofSize: 15)
        userLabel.textAlignment = .left
        
        //sex
//        sexLabel = UILabel(frame: CGRect(x: 150, y: 20, width: 50, height: 13))
//        sexLabel.textColor = UIColor.black
//        sexLabel.font = UIFont.systemFont(ofSize: 13)
//        sexLabel.textAlignment = .left
        
        //birthday
//        birthdayLable = UILabel(frame: CGRect(x: 74, y: 49, width: width-94, height: 13))
//        birthdayLable.textColor = UIColor.gray
//        birthdayLable.font = UIFont.systemFont(ofSize: 13)
//        birthdayLable.textAlignment = .left
        
        contentView.addSubview(iconImv)
        contentView.addSubview(userLabel)
        
//        contentView.addSubview(sexLabel)
//        contentView.addSubview(birthdayLable)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Init(coder:) has not been implementd")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
