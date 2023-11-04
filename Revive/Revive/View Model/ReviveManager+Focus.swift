//
//  ReviveManager+Focus.swift
//  Revive
//
//  Created by Kaile Ying on 11/3/23.
//

import Foundation

extension ReviveManager {
    private func getRandomHatchingSpecies() -> Species {
        let superRarePercent = HatchingMechanics().superRare
        let r = Int.random(in: 0...100)
        var currRaritySpeciesIDs : [Int] = []
        
        if r < Int(superRarePercent * 100) {
            for species in speciesList {
                if species.rarity == "SR" {
                    currRaritySpeciesIDs.append(species.id)
                }
            }
        } else {
            for species in speciesList {
                if species.rarity == "R" {
                    currRaritySpeciesIDs.append(species.id)
                }
            }
        }
        
        let randomSpecies = Int.random(in: 0..<currRaritySpeciesIDs.count)
        return speciesList[currRaritySpeciesIDs[randomSpecies] + 1]
    }
}
