//
//  ReviveManager+Focus.swift
//  Revive
//
//  Created by Kaile Ying on 11/3/23.
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
    
    func getSpeciesIndex(id: Int, date: String) -> Int {
        for i in 0..<mySpecies.count {
            if mySpecies[i].speciesID == id && mySpecies[i].hatchDate == date {
                return i
            }
        }
        
        return -1
    }
    
    func getLevelUpNum(species: MySpecies) -> (Int, Int) {
        let myspecies = mySpecies[getSpeciesIndex(id: species.speciesID, date: species.hatchDate)]
        var totalExp = selectedTime
        var currExp = myspecies.currExp
        var num = 0

        while totalExp > 0 {
            let levelExp = getCurrSpeciesTotalExp(id: myspecies.speciesID, date: myspecies.hatchDate)
            if totalExp >= levelExp - currExp {
                totalExp -= levelExp - currExp
                currExp = 0
                num += 1
            } else {
                currExp = currExp + totalExp
                break
            }
        }
        
        return (num, currExp)
    }
    
    // Exploring State Change
    
    func getMap(map: MyMaps) -> ExploringMap {
        return mapList[map.id-5002]
    }
    
    func getNextRewardTimeRemain() -> Int {
        let currMapTime = currExploringMap?.currTime
        let points : [String:[String:Int]] = getMap(map: currExploringMap!).rewardPoint
        
        for point in points {
            guard let pointTime = Int(point.key) else {
                return 0
            }
            
            if pointTime > currMapTime {
                
            }
        }
    }
    
    func isMapTypeFitsSpecies(species: MySpecies) -> Bool {
        for x in getMap(map: currExploringMap!).type {
            if getSpecies(mySpecies: species).area.contains(where: {$0.key == x.rawValue} ) {
                return true
            }
        }
        
        return false
    }
    
    func changeToExploringState1() {
        currExploringState = .state1
        UIApplication.shared.isIdleTimerDisabled = false
        currPanelSpecies = mySpecies[0]
        currExploringSpecies = mySpecies[0]
        isTimerStart.toggle()
        timeRemaining = 30 * 60
        activeAlert = .none
    }
    
    func changeToExploringState2() {
        
    }
    
    func initMyMap() {
        if myMaps.isEmpty {
            myMaps.append(MyMaps(id: 5002, isUnlocked: true, currTime: 0))
        }
    }
    
    // Training State Change
    
    func changeToTrainingState1() {
        currTrainingState = .state1
        UIApplication.shared.isIdleTimerDisabled = false
        currPanelSpecies = mySpecies[0]
        currTrainingSpecies = mySpecies[0]
        isTimerStart.toggle()
        timeRemaining = 30 * 60
        activeAlert = .none
    }
    
    func changeToTrainingState2(id: Int, date: String, currExp: Int, levelUpNum: Int) {
        currTrainingState = .state2
//        let idx = self.getSpeciesIndex(id: id, date: date)
//        self.mySpecies[idx].currExp = currExp
//        self.mySpecies[idx].level += levelUpNum
        DataManager.shared.updateMySpeciesLevel(for: id, with: currTrainingSpecies!.level + levelUpNum, mySpecies: mySpecies)
        DataManager.shared.updateMySpeciesCurrExp(for: id, with: currExp, mySpecies: mySpecies)
        
        totalTrainingTime += selectedTime
        totalTime += selectedTime
        UserDefaults.standard.set(totalTrainingTime, forKey: "TotalTrainingTime")
        UserDefaults.standard.set(totalTime, forKey: "TotalTime")
        
        let currentDate = Date()
        let logg = FocusLog(date: currentDate, duration: Int(selectedTime/60), action: "training")
        focusLog.append(logg)
        currFocusLog = groupAndCalculateDurations()
        DataManager.shared.saveLogData(customItem: logg)
    }
    
    // Hatching State Change
    
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
        let dateString = dateToString(date: currentDate, format: "yyyy-MM-dd HH:mm:ss")
        
        let currS = MySpecies(speciesID: (currHatchingSpecies?.id) ?? 0, nickName: currHatchingSpecies?.name ?? "", level: 1, currExp: 0, height: randomHeight, weight: randomWeight, favorite: false, hatchDate: dateString)
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
