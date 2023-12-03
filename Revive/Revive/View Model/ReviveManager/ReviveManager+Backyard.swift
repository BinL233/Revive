//
//  ReviveManager+Backyard.swift
//  Revive
//
//  Created by Kaile Ying on 11/10/23.
//

import Foundation
import SwiftUI

extension ReviveManager {
    func getSpecies(mySpecies: MySpecies) -> Species {
        return speciesList[mySpecies.speciesID-1]
    }
    
    func SpeciesFavorToggle(id: Int, date: Date) {
        for i in (0..<mySpecies.count) {
            if mySpecies[i].hatchDate == date && mySpecies[i].speciesID == id {
                mySpecies[i].favorite.toggle()
            }
        }
    }
    
    func getCurrSpeciesTotalExp(id: Int, date: Date) -> Int {
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
    
    func getTraitBGColor(trait: Trait) -> Color {
        if trait == .carnivore {
            return Color.cRed
        } else if trait == .herbivore {
            return Color.cGreen
        } else {
            return Color.cBlue
        }
    }
    
    func getAdvantageAreaColor(area: String) -> Color {
        switch area {
        case "Plain":
            return Color(hue: 145, saturation: 0.63, brightness: 0.49)
        case "Desert":
            return Color(hue: 37, saturation: 0.9, brightness: 0.51)
        case "Rainforest":
            return Color(hue: 168, saturation: 0.76, brightness: 0.36)
        case "Ocean":
            return Color(hue: 204, saturation: 0.64, brightness: 0.44)
        case "Glacier":
            return Color(hue: 204, saturation: 0.05, brightness: 0.67)
        case "River":
            return Color(hue: 204, saturation: 0.7, brightness: 0.53)
        case "Beach":
            return Color(hue: 48, saturation: 0.89, brightness: 0.5)
        case "Volcano":
            return Color(hue: 6, saturation: 0.63, brightness: 0.41)
        case "Sky":
            return Color(hue: 204, saturation: 0.51, brightness: 0.67)
            
        default:
            return .cBlack
        }
    }
}
