//
//  ReviveManager+Timer.swift
//  Revive
//
//  Created by Kaile Ying on 11/3/23.
//

import Foundation

extension ReviveManager {
    func timeStringGetter() -> String {
        let time = Int(timeRemaining)
        var hour : Int = 0
        var min : Int = 0
        var sec : Int = 0
        
        hour = time / 3600
        min = time % 3600 / 60
        sec = time % 60
        
        return String(format: "%02d", hour) + ":" + String(format: "%02d", min) + ":" + String(format: "%02d", sec)
    }
}
