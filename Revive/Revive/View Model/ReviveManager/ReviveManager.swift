//
//  ReviveManager.swift
//  Revive
//
//  Created by Kaile Ying on 11/3/23.
//

import Foundation
import Observation
import CoreData

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
    var testMode : TestMode
    // var standardMySpecies : [MySpecies]
    var currPanelSpecies : MySpecies?
    var speciesItemsSelection : SpeciesItems
    
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
        testMode = .off
//        standardMySpecies = [MySpecies(speciesID: 1, level: 1, height: 2.2, weight: 3.3, favorite: false, hatchDate: <#T##String#>), MySpecies(speciesID: 3, level: 2, height: 1.1, weight: 4.4, favorite: true), MySpecies(speciesID: 5, level: 1, height: 2.2, weight: 3.3, favorite: false), MySpecies(speciesID: 7, level: 1, height: 2.2, weight: 3.3, favorite: false)]
        currPanelSpecies = localMySpecies.count == 0 ? nil : localMySpecies[0]
        speciesItemsSelection = .Species
    }
    
    func test() {
        print("test")
    }
}
