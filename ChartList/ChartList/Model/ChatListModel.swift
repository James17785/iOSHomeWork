//
//  ChatListModel.swift
//  ChartList
//
//  Created by VAM TEAM on 21/3/2019.
//  Copyright © 2019 chinasoft. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ChatListModel {
    var avatarUrl = ""
    var nickName = ""
    var recentMsg = ""

    
    init(jsonData:JSON){
        self.avatarUrl = jsonData["avatarUrl"].stringValue
        self.nickName = jsonData["nickName"].stringValue
        self.recentMsg = jsonData["recentMsg"].stringValue
        
    }
}
