//
//  ReviveManager+Timer.swift
//  Revive
//
//  Created by Kaile Ying on 11/3/23.
//

import Foundation

extension ReviveManager {
    func timeConvertor(time: Int) -> String {
        var hour : Int = 0
        var min : Int = 0
        if time < 60 {
            min = time
        } else {
            hour = time / 60
            min = time % 60
        }
        
        return String(format: "%02d", hour) + ":" + String(format: "%02d", min)
    }
}
