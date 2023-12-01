//
//  ExploringMap.swift
//  Revive
//
//  Created by Kaile Ying on 11/30/23.
//

import Foundation

struct ExploringMap : Identifiable, Decodable {
    let id : Int
    let name : String
    let totalTime : Int
    let rewardPoint : [String:[String:Int]]
    let type : [MapType]
    let rewards : [String:Double]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case totalTime
        case rewardPoint = "reward_point"
        case type
        case rewards
    }
    
    static var maps : [ExploringMap]? = {
        return Persistences(filename: "ExploringMap").components
    }()
}

extension ExploringMap {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        totalTime = try values.decode(Int.self, forKey: .totalTime)
        rewardPoint = try values.decode([String:[String:Int]].self, forKey: .rewardPoint)
        type = try values.decode([MapType].self, forKey: .type)
        rewards = try values.decode([String:Double].self, forKey: .rewards)
    }
}

enum MapType : String, Decodable {
    case Plain, Desert, Rainforest, Ocean, Glaicer, River, Beach, Volcano
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let decodedString = try container.decode(String.self)

        guard let value = MapType(rawValue: decodedString) else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid function type value")
        }

        self = value
    }
}
