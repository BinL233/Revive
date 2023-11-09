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
        // Need to be improved
        var randomSpecies = Int.random(in: 0..<currRaritySpeciesIDs.count)
        while true {
            if speciesList[currRaritySpeciesIDs[randomSpecies] - 1].stage == 1 {
                break
            }
            randomSpecies = Int.random(in: 0..<currRaritySpeciesIDs.count)
        }
        
        return speciesList[currRaritySpeciesIDs[randomSpecies] - 1]
    }
    
    func hatchingStartButton() -> Species {
        return getRandomHatchingSpecies()
    }
    
    func changeToHatchingState1() {
        currHatchingState = .state1
        isTimerStart.toggle()
        timeRemaining = 35 * 60
        currHatchingEgg = 1001
        activeAlert = .none
    }
    
    func changeToHatchingState2() {
        currHatchingEgg = currHatchingSpecies?.egg ?? 0
    }
    
    func changeToHatchingState3() {
        currHatchingState = .state3
        
        let maxHeight = currHatchingSpecies?.height.L ?? 0
        let minHeight = currHatchingSpecies?.height.S ?? 0
        let maxWeight = currHatchingSpecies?.weight.L ?? 0
        let minWeight = currHatchingSpecies?.weight.S ?? 0
        let randomHeight = Double.random(in: minHeight...maxHeight)
        let randomWeight = Double.random(in: minWeight...maxWeight)
        
        mySpecies.append(MySpecies(speciesID: (currHatchingSpecies?.id) ?? 0, level: 1, height: randomHeight, weight: randomWeight))
        DataManager.shared.saveData(customItems: mySpecies)
    }
}
