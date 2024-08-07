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
    let description : String
    let function : String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case trait
        case functionType = "function_type"
        case amount
        case description
        case function
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
        description = try values.decode(String.self, forKey: .description)
        function = try values.decode(String.self, forKey: .function)
    }
}

enum FunctionType: String, Decodable {
    case exp, hatchingTime = "hatching_time", trainingTime = "training_time", exploringTime = "exploring_time", rarityUp = "rarity_up", friendship

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
    case carnivore, herbivore, omnivore
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let decodedString = try container.decode(String.self)

        guard let value = Trait(rawValue: decodedString) else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid function type value")
        }

        self = value
    }
}
