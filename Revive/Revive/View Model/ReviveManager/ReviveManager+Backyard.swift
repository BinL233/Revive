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
    
    func SpeciesFavorToggle(id: Int, date: String) {
        for i in (0..<mySpecies.count) {
            if mySpecies[i].hatchDate == date && mySpecies[i].speciesID == id {
                mySpecies[i].favorite.toggle()
            }
        }
    }
    
    func getCurrSpeciesTotalExp(id: Int, date: String) -> Int {
        for i in (0..<mySpecies.count) {
            if mySpecies[i].hatchDate == date && mySpecies[i].speciesID == id {
                return 10 * 60 + (mySpecies[i].level-1) * 5 * 60
            }
        }
        return 1
    }
    
}
