

import UIKit
import SnapKit
import RandomColorSwift
import Kingfisher

class SingleChartTableViewCell: ChatModelTableViewCell {

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
            make.top.left.equalTo(AppConstraint.Common.leftSpace)
            make.bottom.equalToSuperview().offset(-AppConstraint.Common.leftSpace)
            make.height.equalTo(AppConstraint.Common.avatarHeight)
            make.width.equalTo(AppConstraint.Common.avatarWidth)


        }
        
        self.contentView.addSubview(recentMessageLabel)
        recentMessageLabel.numberOfLines = 0
        //        recentMessageLabel.backgroundColor = randomColor()
        recentMessageLabel.snp.makeConstraints { (make) in make.top.equalTo(avatarImageView).offset(AppConstraint.SingleChat.messageTopSpace)
            make.right.equalToSuperview().offset(-AppConstraint.SingleChat.messageRightSpace)
            make.left.equalTo(avatarImageView.snp.right).offset(AppConstraint.Common.leftSpace)
            
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
