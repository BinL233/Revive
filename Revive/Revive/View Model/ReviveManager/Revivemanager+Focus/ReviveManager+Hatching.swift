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
        let randomNum = Int.random(in: 0..<(100-Int(upRate)-Int(rarityBuffRate*100)))
        var rarityToFilter = "R"
        
        if randomNum <= 0 {
            rarityToFilter = "SR"
        } else {
            rarityToFilter = randomNum < Int(superRarePercent * 100) ? "SR" : "R"
        }
        
        var filteredSpeciesIDs = speciesList.filter { $0.stage == 1 && $0.rarity == rarityToFilter && $0.hatchTime*60 <= selectedTime }.map { $0.id }
        
        if filteredSpeciesIDs.isEmpty {
            filteredSpeciesIDs = speciesList.filter { $0.stage == 1 && $0.rarity == "R" && $0.hatchTime*60 <= selectedTime }.map { $0.id }
        }
        let randomSpecies = Int.random(in: 0..<filteredSpeciesIDs.count)
        
        return speciesList[filteredSpeciesIDs[randomSpecies] - 1]
    }
    

    func hatchingStartButton() -> Species {
        if isHatchingBuff {
            timeRemaining = timeRemaining * hatchingBuffRate
        }
        
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
        sta[0].totalHatchingTime += selectedTime
        sta[0].totalTime += selectedTime
        sta[0].numOfSpecies += 1
        
        if getSpecies(mySpecies: currS).rarity == "R" {
            sta[0].numOfRSpecies += 1
        } else if getSpecies(mySpecies: currS).rarity == "SR" {
            sta[0].numOfSRSpecies += 1
        } else {
            sta[0].numOfSSRSpecies += 1
        }
        
        deleteStaData()
        saveStaData()
        
        updatePendingItem()
        resetBuffRate()
        
        // Save log
        let logg = FocusLog(date: currentDate, duration: Int(selectedTime/60), action: "hatching")
        focusLog.append(logg)
        currFocusLog = groupAndCalculateDurations()
        DataManager.shared.saveLogData(customItem: logg)
        
        currPanelSpecies = mySpecies[0]
        if !myItems.isEmpty {
            currPanelItem = myItems[0]
        }
    }

}
