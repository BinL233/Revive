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
    }
    
    func test() {
        print("test")
    }
}
