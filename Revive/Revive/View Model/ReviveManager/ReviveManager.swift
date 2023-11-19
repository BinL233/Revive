//
//  ReviveManager.swift
//  Revive
//
//  Created by Kaile Ying on 11/3/23.
//

import Foundation
import Observation
import CoreData
import SwiftUI

@Observable
class ReviveManager {
    var speciesList : [Species]
    var mySpecies : [MySpecies]
    var currHatchingSpecies : Species?
    var currAction : CurrAction
    var currHatchingEgg : Int
    var timeRemaining : TimeInterval
    var selectedTime : Int
    var isTimerStart : Bool
    var activeAlert : ActiveAlert?
    var currHatchingState : CurrHatchingState
    var currTrainingState : CurrTrainingState
    var testMode : TestMode
    var standardMySpecies : [MySpecies]
    var currPanelSpecies : MySpecies?
    var speciesItemsSelection : SpeciesItems
    var currTrainingSpecies : MySpecies?
    var isExpGain : Bool
    
    var keepDisplay : Bool
    var reminderOn : Bool
    var reminderTime : String
    
    var totalTime : Int
    var totalHatchingTime : Int
    var totalTrainingTime : Int
    var totalExploringTime : Int
    var numOfSpecies : Int
    var numOfRSpecies : Int
    var numOfSRSpecies : Int
    var numOfItems : Int
    var numOfCoins : Int
    
    init() {
        let localTimeRemaining : TimeInterval = 30 * 60
        let localMySpecies = DataManager.shared.loadData()
        
        speciesList = Species.species ?? []
        mySpecies = localMySpecies
        currHatchingSpecies = nil
        currAction = .hatching
        currHatchingEgg = 1001
        timeRemaining = localTimeRemaining
        selectedTime = Int(localTimeRemaining)
        isTimerStart = false
        activeAlert = .none
        currHatchingState = .state1
        currTrainingState = .none
        testMode = .off
        standardMySpecies = [MySpecies(speciesID: 1, level: 1, currExp: 10, height: 2.2, weight: 3.3, favorite: false, hatchDate: "")]
        currPanelSpecies = localMySpecies.count == 0 ? nil : localMySpecies[0]
        speciesItemsSelection = .Species
        currTrainingSpecies = localMySpecies.count == 0 ? nil : localMySpecies[0]
        isExpGain = false
        
        keepDisplay = UserDefaults.standard.bool(forKey: "isKeepDisplay")
        reminderOn = UserDefaults.standard.bool(forKey: "isRemindOn")
        reminderTime = UserDefaults.standard.string(forKey: "ReminderTime") ?? "Please select a time"
        
        totalTime = UserDefaults.standard.integer(forKey: "TotalTime")
        totalHatchingTime = UserDefaults.standard.integer(forKey: "TotalHatchingTime")
        totalTrainingTime = UserDefaults.standard.integer(forKey: "TotalTrainingTime")
        totalExploringTime = UserDefaults.standard.integer(forKey: "TotalExploringTime")
        numOfSpecies = UserDefaults.standard.integer(forKey: "NumOfSpecies")
        numOfRSpecies = UserDefaults.standard.integer(forKey: "NumOfRSpecies")
        numOfSRSpecies = UserDefaults.standard.integer(forKey: "NumOfSRSpecies")
        numOfItems = UserDefaults.standard.integer(forKey: "NumOfItems")
        numOfCoins = UserDefaults.standard.integer(forKey: "NumOfCoins")
        
        userNotificationCenter()
    }
}
