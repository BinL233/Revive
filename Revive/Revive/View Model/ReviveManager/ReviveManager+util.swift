//
//  ReviveManager+util.swift
//  Revive
//
//  Created by Kaile Ying on 11/18/23.
//

import Foundation
import SwiftUI

extension ReviveManager {
    func pauseForTwoSecondsAsync(duration: Double, completion: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async {
            Thread.sleep(forTimeInterval: duration)
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    
    func test() {
        print("test")
    }
    
    func nonOptionalBinding<T>(_ binding: Binding<T?>) -> Binding<T>? {
        guard let value = binding.wrappedValue else {
            return nil
        }
        return Binding<T>(
            get: { value },
            set: { binding.wrappedValue = $0 }
        )
    }
    
    func dateToString(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
        
    }
    
    func secTimeToString(time: Int) -> String {
        let time = time
        var hour : Int = 0
        var min : Int = 0
        var sec : Int = 0
        
        hour = time / 3600
        min = time % 3600 / 60
        sec = time % 60
        
        return String(hour) + ":" + String(format: "%02d", min) + ":" + String(format: "%02d", sec)
    }
}
