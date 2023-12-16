//
//  ReviveManager+Training.swift
//  Revive
//
//  Created by Kaile Ying on 12/2/23.
//

import Foundation
import SwiftUI

extension ReviveManager {
    func getLevelUpNum(species: MySpecies, exp: Int) -> (Int, Int) {
        let myspecies = mySpecies[getSpeciesIndex(id: species.speciesID, date: species.hatchDate)]
        var totalExp = exp
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
    
    func changeToTrainingState1() {
        currTrainingState = .state1
        UIApplication.shared.isIdleTimerDisabled = false
        currPanelSpecies = mySpecies[0]
        currTrainingSpecies = mySpecies[0]
        isTimerStart.toggle()
        timeRemaining = 30 * 60
        activeAlert = .none
    }
    
    func changeToTrainingState2(id: Int, date: Date, currExp: Int, levelUpNum: Int) {
        currTrainingState = .state2
//        let idx = self.getSpeciesIndex(id: id, date: date)
//        self.mySpecies[idx].currExp = currExp
//        self.mySpecies[idx].level += levelUpNum
        DataManager.shared.updateMySpeciesLevel(for: id, for: date, with: currTrainingSpecies!.level + levelUpNum, mySpecies: mySpecies)
        DataManager.shared.updateMySpeciesCurrExp(for: id, for: date, with: currExp, mySpecies: mySpecies)
        
        if !myItems.isEmpty {
            currPanelItem = myItems[0]
        }
        
        sta[0].totalTrainingTime += selectedTime
        sta[0].totalTime += selectedTime
        
        deleteStaData()
        saveStaData()
        
        updatePendingItem()
        resetBuffRate()
        
        let currentDate = Date()
        let logg = FocusLog(date: currentDate, duration: Int(selectedTime/60), action: "training")
        focusLog.append(logg)
        currFocusLog = groupAndCalculateDurations()
        DataManager.shared.saveLogData(customItem: logg)
    }
    
    func quickFinishCompleteView() {
        
    }

}
