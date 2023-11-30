//
//  MySpecies.swift
//  Revive
//
//  Created by Kaile Ying on 11/8/23.
//

import Foundation

struct MySpecies : Equatable {
    let speciesID : Int
    var nickName : String = ""
    var level : Int
    var currExp : Int
    let height : Double
    let weight : Double
    var favorite : Bool
    let hatchDate : String
}
