//
//  File.swift
//  Revive
//
//  Created by Kaile Ying on 11/6/23.
//

import Foundation

enum CurrHatchingState : Identifiable {
    var id: Self { self }
    case state1, state2, state3, none
}

enum CurrTrainingState : Identifiable {
    var id: Self { self }
    case state1, state2, none
}

enum CurrExploringState : Identifiable {
    var id: Self { self }
    case state1, state2, none
}
