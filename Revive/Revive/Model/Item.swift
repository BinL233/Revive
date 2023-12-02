//
//  Item.swift
//  Revive
//
//  Created by Kaile Ying on 11/30/23.
//

import Foundation

struct Item : Identifiable, Decodable {
    let id : Int
    let name : String
    let trait : [Trait]
    let functionType : [FunctionType]
    let amount : [Double]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case trait
        case functionType = "function_type"
        case amount
    }
    
    static var items : [Item]? = {
        return Persistences(filename: "Item").components
    }()
}

extension Item {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        trait = try values.decode([Trait].self, forKey: .trait)
        functionType = try values.decode([FunctionType].self, forKey: .functionType)
        amount = try values.decode([Double].self, forKey: .amount)
    }
}

enum FunctionType: String, Decodable {
    case exp, hatchingTime = "hatching_time", trainingTime = "training_time", exploringTime = "exploring_time", rarityUp = "rarity_up"

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let decodedString = try container.decode(String.self)

        guard let value = FunctionType(rawValue: decodedString) else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid function type value")
        }

        self = value
    }
}

enum Trait : String, Decodable {
    case carnivore, herbivore, omnivorous
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let decodedString = try container.decode(String.self)

        guard let value = Trait(rawValue: decodedString) else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid function type value")
        }

        self = value
    }
}
