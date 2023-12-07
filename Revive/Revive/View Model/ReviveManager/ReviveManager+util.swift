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
    
    func getMap(map: MyMaps) -> ExploringMap {
        return mapList[map.id-5001]
    }
    
    func getMyMapIndex(map: MyMaps) -> Int {
        for i in 0..<myMaps.count {
            if myMaps[i].id == map.id {
                return i
            }
        }
        
        return 0
    }
    
    func saveNewMap(id : Int) {
        DataManager.shared.saveMapData(customItem: MyMaps(id: id, isFinished: false, finishedTimes: 0, currTime: 0, totalTime: 0))
    }
    
    func updateMapData() {
        DataManager.shared.updateMapData(for: currExploringMap?.id ?? 0, with: myMaps[getMyMapIndex(map: currExploringMap!)].currTime, with: myMaps[getMyMapIndex(map: currExploringMap!)].totalTime, with: myMaps[getMyMapIndex(map: currExploringMap!)].finishedTimes , myMaps: myMaps)
    }
    
    func saveStaData() {
        DataManager.shared.saveStaData(customItem: sta[0])
    }
    
    func deleteStaData() {
        DataManager.shared.deleteSta(sta: sta[0])
    }
    
    func updateItemAmount(id: Int, newAmount: Int) {
        DataManager.shared.updateItemCurrTimeData(for: id, with: newAmount, myItems: myItems)
    }
    
    func saveNewItem(id: Int, amount: Int) {
        DataManager.shared.saveItemData(customItem: MyItems(id: id, amount: amount))
    }
    
    func deleteItem(id: Int) {
        DataManager.shared.deleteItemData(for: id)
    }
    
}
