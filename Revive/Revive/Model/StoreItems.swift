//
//  StoreItems.swift
//  Revive
//
//  Created by Kaile Ying on 12/23/23.
//

import Foundation

struct StoreItems : Identifiable, Decodable {
    let id : Int
    let name : String
    let probability : Int
    let price : Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case probability
        case price
    }
    
    static var storeItems : [StoreItems]? = {
        return Persistences(filename: "StoreItems").components
    }()
}

extension StoreItems {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        probability = try values.decode(Int.self, forKey: .probability)
        price = try values.decode(Int.self, forKey: .price)
    }
}
