

import UIKit

class ChatModelTableViewCell: UITableViewCell {

    let avatarImageView = UIImageView(frame: .zero)
    let nickNameLabel = UILabel(frame: .zero)

    var messageType:String?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
