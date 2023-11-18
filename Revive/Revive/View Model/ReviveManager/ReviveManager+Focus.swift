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
            if speciesList[currRaritySpeciesIDs[randomSpecies] - 1].stage == 1{
                if testMode == .on || speciesList[currRaritySpeciesIDs[randomSpecies] - 1].hatchTime*60 >= selectedTime {
                    break
                }
            }
            randomSpecies = Int.random(in: 0..<currRaritySpeciesIDs.count)
        }
        
        return speciesList[currRaritySpeciesIDs[randomSpecies] - 1]
    }
    
//    private func trainSpecies() {
//        var species = currTrainingSpecies
//        
//    }
//    
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
        if testMode == .on {
            totalExp = selectedTime * 100
        }
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
    
    // Training State Change
    
    func changeToTrainingState1() {
        currTrainingState = .state1
        isTimerStart.toggle()
        if testMode == .off {
            timeRemaining = 30 * 60
        } else {
            timeRemaining = 5
        }
        activeAlert = .none
    }
    
    func changeToTrainingState2(id: Int, date: String, currExp: Int, levelUpNum: Int) {
        currTrainingState = .state2
//        let idx = self.getSpeciesIndex(id: id, date: date)
//        self.mySpecies[idx].currExp = currExp
//        self.mySpecies[idx].level += levelUpNum
        self.currPanelSpecies = self.mySpecies[0]
        // self.currTrainingSpecies = self.mySpecies[0]
        DataManager.shared.updateMySpeciesLevel(for: id, with: self.currTrainingSpecies!.level + levelUpNum, mySpecies: self.mySpecies)
        DataManager.shared.updateMySpeciesCurrExp(for: id, with: currExp, mySpecies: self.mySpecies)
    }
    
    // Hatching State Change
    
    func changeToHatchingState1() {
        currHatchingState = .state1
        isTimerStart.toggle()
        if testMode == .off {
            timeRemaining = 30 * 60
        } else {
            timeRemaining = 5
        }
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
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = formatter.string(from: currentDate)
        
        let currS = MySpecies(speciesID: (currHatchingSpecies?.id) ?? 0, level: 1, currExp: 0, height: randomHeight, weight: randomWeight, favorite: false, hatchDate: dateString)
        mySpecies.append(currS)
        DataManager.shared.saveData(customItem: currS)
        currPanelSpecies = mySpecies[0]
    }
}
