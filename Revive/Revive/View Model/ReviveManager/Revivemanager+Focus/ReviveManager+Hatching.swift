//
//  ReviveManager+Hatching.swift
//  Revive
//
//  Created by Kaile Ying on 12/2/23.
//

import Foundation
import SwiftUI

extension ReviveManager {
    private func getRandomHatchingSpecies() -> Species {
        let superRarePercent = HatchingMechanics().superRare
        let upRate = HatchingMechanics().superRareUpRate * Double(selectedTime / 60)
        let rarityToFilter = Int.random(in: 0..<(100-Int(upRate))) < Int(superRarePercent * 100) ? "SR" : "R"
        var filteredSpeciesIDs = speciesList.filter { $0.stage == 1 && $0.rarity == rarityToFilter && $0.hatchTime*60 <= selectedTime }.map { $0.id }
        
        if filteredSpeciesIDs.isEmpty {
            filteredSpeciesIDs = speciesList.filter { $0.stage == 1 && $0.rarity == "R" && $0.hatchTime*60 <= selectedTime }.map { $0.id }
        }
        let randomSpecies = Int.random(in: 0..<filteredSpeciesIDs.count)
        
        return speciesList[filteredSpeciesIDs[randomSpecies] - 1]
    }
    

    func hatchingStartButton() -> Species {
        return getRandomHatchingSpecies()
    }
    
    func changeToHatchingState1() {
        currHatchingState = .state1
        UIApplication.shared.isIdleTimerDisabled = false
        isTimerStart.toggle()
        timeRemaining = 30 * 60
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
        
        let currentDate = Date()
        
        let currS = MySpecies(speciesID: (currHatchingSpecies?.id) ?? 0, nickName: currHatchingSpecies?.name ?? "", level: 1, currExp: 0, height: randomHeight, weight: randomWeight, favorite: false, hatchDate: Date())
        mySpecies.append(currS)
        DataManager.shared.saveData(customItem: currS)
        
        // Save Details
        totalHatchingTime += selectedTime
        totalTime += selectedTime
        numOfSpecies += 1
        
        if getSpecies(mySpecies: currS).rarity == "R" {
            numOfRSpecies += 1
            UserDefaults.standard.set(numOfRSpecies, forKey: "NumOfRSpecies")
        } else if getSpecies(mySpecies: currS).rarity == "SR" {
            numOfSRSpecies += 1
            UserDefaults.standard.set(numOfSRSpecies, forKey: "NumOfSRSpecies")
        }
        
        UserDefaults.standard.set(totalHatchingTime, forKey: "TotalHatchingTime")
        UserDefaults.standard.set(totalTime, forKey: "TotalTime")
        UserDefaults.standard.set(numOfSpecies, forKey: "NumOfSpecies")
        
        // Save log
        let logg = FocusLog(date: currentDate, duration: Int(selectedTime/60), action: "hatching")
        focusLog.append(logg)
        currFocusLog = groupAndCalculateDurations()
        DataManager.shared.saveLogData(customItem: logg)
        
        currPanelSpecies = mySpecies[0]
    }

}
