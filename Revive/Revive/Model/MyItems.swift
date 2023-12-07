//
//  MyItems.swift
//  Revive
//
//  Created by Kaile Ying on 11/30/23.
//

import Foundation

struct MyItems : Equatable, Comparable {
    static func < (lhs: MyItems, rhs: MyItems) -> Bool {
        return Item.items![lhs.id-2001].name < Item.items![rhs.id-2001].name
    }
    
    let id : Int
    var amount : Int
}

