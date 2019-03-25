
import UIKit
import SnapKit
import RandomColorSwift
import Kingfisher

class OutwardsImageViewCell: ChatModelTableViewCell {
    let messgeImg = UIImageView(frame:.zero)
    
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
            make.top.equalTo(AppConstraint.Common.leftSpace)
            make.bottom.equalToSuperview().offset(-AppConstraint.Common.leftSpace)
            make.right.equalTo(-AppConstraint.Common.leftSpace)
            make.height.equalTo(100)
            make.width.equalTo(AppConstraint.Common.avatarWidth)
        }

        
        self.contentView.addSubview(messgeImg)
        messgeImg.snp.makeConstraints { (make) in //make.top.equalTo(avatarImageView).offset(AppConstraint.SingleChat.messageTopSpace)
            //make.left.equalTo(AppConstraint.Common.avatarWidth)
            // make.height.equalTo(AppConstraint.SingleChat.imageHeight)
            // make.width.equalTo(AppConstraint.SingleChat.imageWidth)
            
            make.top.equalTo(avatarImageView).offset(AppConstraint.SingleChat.messageTopSpace)
            make.left.equalTo(AppConstraint.Common.avatarWidth)
            make.right.equalTo(avatarImageView.snp.left).offset(-AppConstraint.Common.leftSpace)
            make.height.equalTo(AppConstraint.SingleChat.imageHeight)
            make.width.equalTo(AppConstraint.SingleChat.imageWidth)
            make.bottom.equalToSuperview().offset(-AppConstraint.Common.leftSpace)
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
