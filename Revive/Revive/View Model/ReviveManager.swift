//
//  ReviveManager.swift
//  Revive
//
//  Created by Kaile Ying on 11/3/23.
//

import Foundation
import Observation

@Observable
class ReviveManager {
    var speciesList : [Species]
    var currAction : CurrAction
    var currHatchingEgg : Int
    
    init() {
        speciesList = Species.species ?? []
        currAction = .hatching
        currHatchingEgg = 1001
    }
}
