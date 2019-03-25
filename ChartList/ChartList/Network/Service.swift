//
//  Service.swift
//  ChartList
//
//  Created by VAM TEAM on 23/3/2019.
//  Copyright © 2019 chinasoft. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Service:NSObject {
    
   public func networkRequest(name:String, callback:NetCallback, errorCallback:NetCallback) {
        let path = Bundle.main.path(forResource: name, ofType: "json")
        let url = URL(fileURLWithPath: path!)
        Alamofire.request(url)
            .responseJSON { response in
                
                print("result==\(response.result)")   // 返回结果，是否成功
                switch response.result {
                case.success(let resp):
                    print("success======", resp)
                    let respData = JSON(resp)
                    callback.success(result: respData)
                    
                    break
                case .failure(let respErr):
                    print("error======",respErr)
                    let respData = JSON(respErr)
                    errorCallback.error(result: respData)
                    break
                }
        }
    }
}


