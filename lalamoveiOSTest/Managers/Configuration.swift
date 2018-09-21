//
//  Configuration.swift
//  lalamoveiOSTest
//
//  Created by TuhinS on 17/09/18.
//  Copyright © 2018 Tuhin S. All rights reserved.
//

import Foundation
import Alamofire

internal struct NetworkConfiguration{
    internal static var environment: ApiEnvironment = .dev
}

internal enum ApiEnvironment {
    case dev, prod
}


struct NetworkChecker{
    static var isActiveInternet: Bool{
        guard let manager = NetworkReachabilityManager() else {
            return false
        }
        
        return manager.isReachable
    }
}
