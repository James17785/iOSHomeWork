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
    var imageUrl:String?
    var message:String?
    var role:String?
    var avatarUrl:String?
    var messageType:String?
    
    
    init(jsonData:JSON){
        self.imageUrl = jsonData["imageUrl"].stringValue
        self.message = jsonData["message"].stringValue
        self.role = jsonData["role"].stringValue
        self.avatarUrl = jsonData["avatarUrl"].stringValue
        self.messageType = jsonData["messageType"].stringValue
        
    }
}
