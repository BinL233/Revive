//
//  BackyardListSorter.swift
//  Revive
//
//  Created by Kaile Ying on 12/6/23.
//

import Foundation

enum SpeciesListSorter : String, Identifiable {
    var id: Self { self }
    case name, favorite, level, rarity, hatchingDate
    
    init?(stringValue: String) {
        switch stringValue {
        case "name":
            self = .name
        case "favorite":
            self = .favorite
        case "level":
            self = .level
        case "rarity":
            self = .rarity
        case "hatchingDate":
            self = .hatchingDate
        default:
            return nil
        }
    }
}

enum ItemListSorter : String, Identifiable {
    var id: Self { self }
    case name, amount
    
    init?(stringValue: String) {
        switch stringValue {
        case "name":
            self = .name
        case "amount":
            self = .amount
        default:
            return nil
        }
    }
}
