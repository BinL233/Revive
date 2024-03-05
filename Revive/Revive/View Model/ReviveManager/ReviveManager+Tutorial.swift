//
//  ReviveManager+Tutorial.swift
//  Revive
//
//  Created by Kaile Ying on 3/5/24.
//

import Foundation

extension ReviveManager {
    func checkNoSpecies() -> Bool {
        if (mySpecies.isEmpty) {
            return true
        }
        
        return false
    }
}
