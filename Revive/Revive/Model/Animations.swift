//
//  Animations.swift
//  Revive
//
//  Created by Kaile Ying on 3/5/24.
//

import Foundation

struct Animations: Codable {
    let id: [String: AnimationType]
    
    static var animations : Animations? = {
        return Persistences(filename: "Animations").components
    }()
}

struct AnimationType: Codable {
    let idle: [String]
    let purchase: [String]
    let touch: [String]
}
    
