//
//  LocalDefaultsManager.swift
//  lalamoveiOSTest
//
//  Created by TuhinS on 21/09/18.
//  Copyright © 2018 Tuhin S. All rights reserved.
//

import Foundation

final class LocalDefaultsManager: UserDefaults {
    private static let instance: LocalDefaultsManager = LocalDefaultsManager()
    internal static var shared: LocalDefaultsManager {
        return instance
    }
    
    private struct DefaultKeys {
        static let responseCache = "deliveryDetails"
    }

    var deliveryDetails: Data?{
        get{
            guard let deliveryDetails = LocalDefaultsManager.shared.value(forKey: DefaultKeys.responseCache) as? Data else {
                return nil
            }
            
            return deliveryDetails
        }
        
        set(newValue){
            LocalDefaultsManager.shared.set(newValue, forKey: DefaultKeys.responseCache)
            LocalDefaultsManager.shared.synchronize()
        }
    }
}
