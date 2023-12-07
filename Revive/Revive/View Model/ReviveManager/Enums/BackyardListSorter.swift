//
//  BackyardListSorter.swift
//  Revive
//
//  Created by Kaile Ying on 12/6/23.
//

import Foundation

enum SpeciesListSorter : Identifiable {
    var id: Self { self }
    case alphabet, favorite, level, rarity, hatchingDate
}

enum ItemListSorter : Identifiable {
    var id: Self { self }
    case alphabet, amount
}
