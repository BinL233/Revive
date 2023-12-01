//
//  Species.swift
//  Revive
//
//  Created by Kaile Ying on 11/3/23.
//

import Foundation

struct Species : Identifiable, Decodable {
    let name : String
    let id : Int
    let stage : Int
    let rarity : String
    let hatchTime : Int
    let evolveAt : Int?
    let lifeSpan : [Int]?
    let height : Size
    let weight : Size
    let era : String
    let egg : Int
    let flip : Bool
    let area : [String: Double]
    let intro : String
    
    enum CodingKeys: String, CodingKey {
        case name
        case id
        case stage
        case rarity
        case hatchTime = "hatch_time"
        case evolveAt = "evolve_at"
        case lifeSpan = "life_span"
        case height
        case weight
        case era
        case egg
        case flip
        case area
        case intro
    }
    
    static var species : [Species]? = {
        return Persistences(filename: "SpeciesInfo").components
    }()
}

extension Species {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        id = try values.decode(Int.self, forKey: .id)
        stage = try values.decode(Int.self, forKey: .stage)
        rarity = try values.decode(String.self, forKey: .rarity)
        hatchTime = try values.decode(Int.self, forKey: .hatchTime)
        evolveAt = try values.decodeIfPresent(Int.self, forKey: .evolveAt)
        lifeSpan = try values.decodeIfPresent([Int].self, forKey: .lifeSpan)
        height = try values.decode(Size.self, forKey: .height)
        weight = try values.decode(Size.self, forKey: .weight)
        era = try values.decode(String.self, forKey: .era)
        egg = try values.decode(Int.self, forKey: .egg)
        flip = try values.decode(Bool.self, forKey: .flip)
        area = try values.decode([String:Double].self, forKey: .area)
        intro = try values.decode(String.self, forKey: .intro)
    }
}

struct Size : Decodable{
    let S : Double
    let M : Double
    let L : Double
    let offset : Double
}
