//
//  ChartListCellTableViewCell.swift
//  ChartList
//
//  Created by VAM TEAM on 20/2/2019.
//  Copyright © 2019 chinasoft. All rights reserved.
//

import UIKit
import SnapKit
import RandomColorSwift
import Kingfisher

class ChartListCell: UITableViewCell {

    let avatarImageView = UIImageView(frame: .zero)
    let nickNameLabel = UILabel(frame: .zero)
    let recentMessageLabel = UILabel(frame: .zero)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(avatarImageView)
        avatarImageView.backgroundColor = randomColor()
        avatarImageView.layer.cornerRadius = AppConstraint.Common.cornerRadius
        avatarImageView.layer.masksToBounds = true

        avatarImageView.snp.makeConstraints { (make) in
            make.left.top.equalTo(AppConstraint.Common.leftSpace)
            make.bottom.equalToSuperview().offset(-AppConstraint.Common.leftSpace)
            make.width.height.equalTo(AppConstraint.Common.avatarWidth)
        }

        self.contentView.addSubview(nickNameLabel)
        nickNameLabel.snp.makeConstraints { (make) in

           make.left.equalTo(avatarImageView.snp.right).offset(AppConstraint.Common.leftSpace)
            make.top.equalTo(avatarImageView).offset(AppConstraint.ChatList.nickNameTopSpace)
            make.right.equalToSuperview().offset(-AppConstraint.Common.leftSpace)


        }

        self.contentView.addSubview(recentMessageLabel)
        recentMessageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nickNameLabel.snp.bottom).offset(AppConstraint.ChatList.nickNameTopSpace)
            make.right.equalToSuperview().offset(-AppConstraint.Common.leftSpace)
            make.left.right.equalTo(nickNameLabel)

        }
    }
  
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
