//
//  DeliveryListDataModel.swift
//  lalamoveiOSTest
//
//  Created by TuhinS on 16/09/18.
//  Copyright © 2018 Tuhin S. All rights reserved.
//

import Foundation

struct DeliveryListData: Codable {
    let id: Int?
    let description: String?
    let imageUrl: String?
    let location: DeliveryLocationModel?
    
    enum CodingKeys: String, CodingKey{
        case id
        case description
        case imageUrl
        case location
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        imageUrl = try values.decodeIfPresent(String.self, forKey: .imageUrl)
        location = try values.decodeIfPresent(DeliveryLocationModel.self, forKey: .location)
    }
}


struct DeliveryLocationModel: Codable{
    let latitude: Double?
    let longitude: Double?
    let address: String?

    enum CodingKeys: String, CodingKey {
        case address
        case latitude = "lat"
        case longitude = "lng"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        latitude = try values.decodeIfPresent(Double.self, forKey: .latitude)
        longitude = try values.decodeIfPresent(Double.self, forKey: .longitude)
    }
}
