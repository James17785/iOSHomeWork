//
//  SingleChatModel.swift
//  ChartList
//
//  Created by VAM TEAM on 21/3/2019.
//  Copyright © 2019 chinasoft. All rights reserved.
//

import Foundation
import SwiftyJSON

struct SingleChatModel {
    var nameID:String?
    var recentMsg:String?
    var isInWards:Bool?
    var avatarUrl:String?
    var messageType:String?
    
    
    init(jsonData:JSON){
        self.nameID = jsonData["nameID"].stringValue
        self.recentMsg = jsonData["recentMsg"].stringValue
        self.isInWards = jsonData["isInWards"].boolValue
        self.avatarUrl = jsonData["avatarUrl"].stringValue
        self.messageType = jsonData["messageType"].stringValue
        
    }
}
