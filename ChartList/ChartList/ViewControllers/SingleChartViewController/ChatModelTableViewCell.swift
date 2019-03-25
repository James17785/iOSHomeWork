//
//  ChatModelTableViewCell.swift
//  ChartList
//
//  Created by VAM TEAM on 20/3/2019.
//  Copyright © 2019 chinasoft. All rights reserved.
//

import UIKit

class ChatModelTableViewCell: UITableViewCell {

    let avatarImageView = UIImageView(frame: .zero)
    let nickNameLabel = UILabel(frame: .zero)
    let recentMessageLabel = UILabel(frame: .zero)
    var messageType:String = ""
    let messgeImg = UIImageView(frame:.zero)
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
