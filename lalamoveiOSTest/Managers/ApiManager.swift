//
//  ApiManager.swift
//  lalamoveiOSTest
//
//  Created by TuhinS on 17/09/18.
//  Copyright © 2018 Tuhin S. All rights reserved.
//

import Foundation

typealias HostName = ApiStatics.BaseApi
typealias EndPoint = ApiStatics.EndPoints

internal struct ApiStatics{
    internal struct BaseApi{
        static var hostUrl: String{
            switch NetworkConfiguration.environment{
            case .dev:
                return "https://mock-api-mobile.dev.lalamove.com/"
                
            case .prod:
                return "" //Replace with some production Host URL
            }
        }
    }
    
    internal struct EndPoints{
        static let deliveries: String = "deliveries"
    }
}
