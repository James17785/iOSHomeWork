//
//  AppConstraintConfig.swift
//  ChartList
//
//  Created by VAM TEAM on 20/2/2019.
//  Copyright © 2019 chinasoft. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Contstrain
struct AppConstraint {
    struct Common {
        static let leftSpace: CGFloat = 15
        static let avatarWidth: CGFloat = 48
        static let avatarHeight: CGFloat = 48
        
        static let cornerRadius: CGFloat = 8
    }
    struct ChatList {
        static let nickNameTopSpace:CGFloat = 4
        
    }
    struct SingleChat {
        static let messageTopSpace:CGFloat = 4
        static let messageRightSpace:CGFloat = 63
        static let imageHeight:CGFloat = 200
        static let imageWidth:CGFloat = 200
        
    }
}
