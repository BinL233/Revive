//
//  ReviveManager+Timer.swift
//  Revive
//
//  Created by Kaile Ying on 11/3/23.
//

import Foundation

@available(iOS 17.0, *)
extension ReviveManager_ios17 {
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
    
    func timerStart() {
        focusTimer?.cancel()
        focusTimer = Timer.publish(every: testMode == .on ? 0.001 : 1, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                self.timeRemaining -= 1
            }
    }

}

@available(iOS 16.0, *)
extension ReviveManager_ios16 {
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
    
    func timerStart() {
        focusTimer?.cancel()
        focusTimer = Timer.publish(every: testMode == .on ? 0.001 : 1, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                self.timeRemaining -= 1
            }
    }

}
