//
//  ReviveManager+Backyard.swift
//  Revive
//
//  Created by Kaile Ying on 11/10/23.
//

import Foundation

extension ReviveManager {
    func getSpecies(mySpecies: MySpecies) -> Species {
        return speciesList[mySpecies.speciesID-1]
    }
}
