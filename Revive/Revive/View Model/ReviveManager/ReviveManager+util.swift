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
    
    func optionDateToString(date: Date?, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date ?? Date())
        
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
    
    func bindingSecTimeToString(time: Binding<Int>) -> String {
        let time = time.wrappedValue
        var hour : Int = 0
        var min : Int = 0
        var sec : Int = 0
        
        hour = time / 3600
        min = time % 3600 / 60
        sec = time % 60
        
        return String(hour) + ":" + String(format: "%02d", min) + ":" + String(format: "%02d", sec)
    }
    
    func secTimeToString2(time: Int) -> String {
        let time = time
        var hour : Int = 0
        var min : Int = 0
        
        hour = time / 60
        min = time % 60
        
        return String(hour) + "h " + String(format: "%02d", min) + "m "
    }
    
    func randomColor() -> Color {
        Color(
            red: Double.random(in: 0.5...0.9),
            green: Double.random(in: 0.5...0.9),
            blue: Double.random(in: 0.5...0.9)
        )
    }
    
    func getSpeciesIndex(id: Int, date: Date) -> Int {
        for i in 0..<mySpecies.count {
            if mySpecies[i].speciesID == id && mySpecies[i].hatchDate == date {
                return i
            }
        }
        
        return -1
    }
}
