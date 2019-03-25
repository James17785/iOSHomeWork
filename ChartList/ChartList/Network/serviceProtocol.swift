//
//  serviceProtocol.swift
//  ChartList
//
//  Created by VAM TEAM on 23/3/2019.
//  Copyright © 2019 chinasoft. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol NetCallback {
    func success(result:JSON)->()
    func error(result:JSON)->()
}
