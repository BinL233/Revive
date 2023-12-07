//
//  MySpecies.swift
//  Revive
//
//  Created by Kaile Ying on 11/8/23.
//

import Foundation

struct MySpecies : Equatable, Comparable {
    static func < (lhs: MySpecies, rhs: MySpecies) -> Bool {
        return lhs.nickName < rhs.nickName
    }
    
    let speciesID : Int
    var nickName : String = ""
    var level : Int
    var currExp : Int
    let height : Double
    let weight : Double
    var favorite : Bool
    let hatchDate : Date
}
