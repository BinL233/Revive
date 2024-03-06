//
//  SpeciesIDs.swift
//  Revive
//
//  Created by Kaile Ying on 3/5/24.
//

import Foundation

enum IDs: String, CaseIterable, Identifiable {
    case id4001 = "4001"
    case id001 = "001"
    case id002 = "002"
    case id003 = "003"
    var id: Self { self }
}
