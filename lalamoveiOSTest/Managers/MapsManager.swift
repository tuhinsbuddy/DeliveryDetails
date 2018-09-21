//
//  MapsManager.swift
//  lalamoveiOSTest
//
//  Created by TuhinS on 19/09/18.
//  Copyright © 2018 Tuhin S. All rights reserved.
//

import Foundation
import GoogleMaps

final class MapsManager: NSObject {
    private let mapApiKey: String = ""
    private static let single: MapsManager = MapsManager()
    internal static var shared: MapsManager{
        return single
    }
    
    private override init() {
        super.init()
    }
    
    func setUpMap(){
        guard !mapApiKey.isEmpty else {
            debugPrint("Please provide an Api Key above. Without the api key Google Map will not able to work!")
            fatalError()
        }
        
        GMSServices.provideAPIKey(mapApiKey)
    }
    
}
