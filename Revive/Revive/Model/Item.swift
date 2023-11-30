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
    let amount : [Int]
    
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
        amount = try values.decode([Int].self, forKey: .amount)
    }
}

enum FunctionType : Identifiable, Decodable {
    var id: Self { self }
    case exp, hatchingTime, trainingTime, exploringTime
}

enum Trait : Identifiable, Decodable {
    var id: Self { self }
    case carnivore, herbivore, omnivorou
}
