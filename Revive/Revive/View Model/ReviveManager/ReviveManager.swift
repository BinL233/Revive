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
    var standardMySpecies : [MySpecies]
    
    init() {
        let localTimeRemaining : TimeInterval = 35 * 60
        
        speciesList = Species.species ?? []
        mySpecies = DataManager.shared.loadData()
        currHatchingSpecies = nil
        currAction = .hatching
        currHatchingEgg = 1001
        timeRemaining = localTimeRemaining
        selectedTime = Int(localTimeRemaining)
        isTimerStart = false
        activeAlert = .none
        currHatchingState = .state1
        testMode = .off
        standardMySpecies = [MySpecies(speciesID: 1, level: 1, height: 2.2, weight: 3.3, favorite: false), MySpecies(speciesID: 3, level: 2, height: 1.1, weight: 4.4, favorite: true)]
    }
    
    func test() {
        print("test")
    }
}
