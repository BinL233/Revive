//
//  ReviveManager+Tutorial.swift
//  Revive
//
//  Created by Kaile Ying on 3/5/24.
//

import Foundation

@available(iOS 17.0, *)
extension ReviveManager_ios17 {
    func checkNoSpecies() -> Bool {
        if (mySpecies.isEmpty) {
            return true
        }
        
        return false
    }
}

@available(iOS 16.0, *)
extension ReviveManager_ios16 {
    func checkNoSpecies() -> Bool {
        if (mySpecies.isEmpty) {
            return true
        }
        
        return false
    }
}
