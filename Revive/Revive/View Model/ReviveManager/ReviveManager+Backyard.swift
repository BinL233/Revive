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
                return 10 * 60 + (mySpecies[i].level-1) * 70
            }
        }
        return 1
    }
    
    func canEvolve() -> Bool {
        if getSpecies(mySpecies: currPanelSpecies!).evolveAt != nil && currPanelSpecies?.level ?? 999 >= getSpecies(mySpecies: currPanelSpecies!).evolveAt! {
            return true
        }
        
        return false
    }
    
    func getMyPanelItem(id: Int) -> MyItems {
        for x in myItems {
            if x.id == id {
                return x
            }
        }
        
        return myItems[0]
    }
    
    func getItem(id: Int) -> Item {
        return itemList[id - 2001]
    }
}
