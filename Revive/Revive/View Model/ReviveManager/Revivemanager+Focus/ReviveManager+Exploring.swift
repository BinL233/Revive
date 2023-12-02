//
//  ReviveManager+Exploring.swift
//  Revive
//
//  Created by Kaile Ying on 12/2/23.
//

import Foundation
import SwiftUI

extension ReviveManager {
    func getMap(map: MyMaps) -> ExploringMap {
        return mapList[map.id-5001]
    }
    
    func getLastNextPoint() -> (Int, Int) {
        let points : [String:[String:Int]] = getMap(map: currExploringMap!).rewardPoint
        let sortedPoints = points.sorted { Int($0.key)! < Int($1.key)! }
        
        for i in 0..<sortedPoints.count {
            guard let pointTime : Int = Int(sortedPoints[i].key) else {
                return (0, 0)
            }
            
            guard let currMapTime = currExploringMap?.currTime else {
                return (0, 0)
            }
            
            if pointTime > currMapTime {
                if i == 0 {
                    return (0, pointTime)
                } else {
                    guard let lastPoint : Int = Int(sortedPoints[i-1].key) else {
                        return (0, 0)
                    }
                    return (lastPoint, pointTime)
                }
            }
        }
        
        return (0, 0)
    }
    
    func getNextRewardTimeRemain() -> Int {
        let points : [String:[String:Int]] = getMap(map: currExploringMap!).rewardPoint
        let sortedPoints = points.sorted { Int($0.key)! < Int($1.key)! }
        
        for point in sortedPoints {
            guard let pointTime : Int = Int(point.key) else {
                return 0
            }
            
            guard let currMapTime = currExploringMap?.currTime else {
                return 0
            }
            
            if pointTime > currMapTime {
                return pointTime - currMapTime
            }
        }
        
        return 0
    }
    
    func getRewards() -> [Int:Int] {
        let mapRewards : [String:[Int]] = getMap(map: currExploringMap!).rewards
        var rewards : [Int:Int] = [:]
        
        for _ in 0..<Int(selectedTime/60/10) {
            let rollNum = Int.random(in: 1...100)
            let filteredReward = mapRewards.first{ $0.value[0] <= rollNum && $0.value[1] >= rollNum }
            
            guard let targetKey = Int(filteredReward!.key) else {
                return [0:0]
            }
            
            if rewards.keys.contains(targetKey) {
                rewards[targetKey] = (rewards[targetKey] ?? 0) + 1
            } else {
                rewards[targetKey] = 1
            }
        }
        
        currExploringItems = rewards
        
        print(currExploringItems)
        
        return rewards
    }
    
    func isMapTypeFitsSpecies(species: MySpecies) -> Bool {
        for x in getMap(map: currExploringMap!).type {
            if getSpecies(mySpecies: species).area.contains(where: {$0.key == x.rawValue} ) {
                return true
            }
        }
        
        return false
    }
    
    func changeToExploringState1() {
        currExploringState = .state1
        UIApplication.shared.isIdleTimerDisabled = false
        currPanelSpecies = mySpecies[0]
        currExploringSpecies = mySpecies[0]
        isTimerStart.toggle()
        timeRemaining = 30 * 60
        activeAlert = .none
    }
    
    func changeToExploringState2() {
        currExploringState = .state2
        
        totalExploringTime += selectedTime
        totalTime += selectedTime
        UserDefaults.standard.set(totalExploringTime, forKey: "TotalExploringTime")
        UserDefaults.standard.set(totalTime, forKey: "TotalTime")
        
        let currentDate = Date()
        let logg = FocusLog(date: currentDate, duration: Int(selectedTime/60), action: "exploring")
        focusLog.append(logg)
        currFocusLog = groupAndCalculateDurations()
        DataManager.shared.saveLogData(customItem: logg)
        
    }
    
    func initMyMap() {
        if myMaps.isEmpty {
            myMaps.append(MyMaps(id: 5001, isUnlocked: true, currTime: 0))
        }
    }
}
