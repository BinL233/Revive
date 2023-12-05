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
    
    func getMyMapIndex(map: MyMaps) -> Int {
        for i in 0..<myMaps.count {
            if myMaps[i].id == map.id {
                return i
            }
        }
        
        return 0
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
        
        return (-1, -1)
    }
    
    func mapFinished() {
        myMaps.append(MyMaps(id: myMaps.count + 5001, isFinished: false, finishedTimes: 0, currTime: 0, totalTime: 0))
        myMaps[getMyMapIndex(map: currExploringMap!)].isFinished = true
        myMaps[getMyMapIndex(map: currExploringMap!)].finishedTimes += 1
        myMaps[getMyMapIndex(map: currExploringMap!)].currTime = 0
        selectedTime = 0
        
        saveNewMap(id: myMaps.count + 5000)
        updateMapData()
    }
    
    func getNextRewardTimeRemain(map: MyMaps) -> Int {
        let points : [String:[String:Int]] = getMap(map: map).rewardPoint
        let sortedPoints = points.sorted { Int($0.key)! < Int($1.key)! }
        
        for point in sortedPoints {
            guard let pointTime : Int = Int(point.key) else {
                return 0
            }
            
            let currMapTime = map.currTime
            
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
        
        return rewards
    }
    
    func getTreasureRewards() -> [Int:Int] {
        let treasureRewards : [String:[String:Int]] = getMap(map: currExploringMap!).rewardPoint
        var rewards : [Int:Int] = [:]
        
        for point in treasureRewards.keys {
            if Int(point)! > currExploringMap!.currTime - selectedTime && Int(point)! <= currExploringMap!.currTime {
                for item in treasureRewards[point]!.keys {
                    if rewards.keys.contains(Int(item)!) {
                        rewards[Int(item)!]! += 1
                    } else {
                        rewards[Int(item)!] = 1
                    }
                }
            }
        }
        
        return rewards
    }
    
    func rewardsAddToBag() {
        for item in currExploringItems {
            if myItems.contains(where: { $0.id == item.key }) {
                for i in 0..<myItems.count {
                    if myItems[i].id == item.key {
                        myItems[i].amount += item.value
                        updateItemAmount(id: myItems[i].id, newAmount: myItems[i].amount)
                    }
                }
            } else {
                myItems.append(MyItems(id: item.key, amount: item.value))
                saveNewItem(id: item.key, amount: item.value)
            }
        }
        
        for item in currExploringFixedRewards {
            if myItems.contains(where: { $0.id == item.key }) {
                for i in 0..<myItems.count {
                    if myItems[i].id == item.key {
                        myItems[i].amount += item.value
                        updateItemAmount(id: myItems[i].id, newAmount: myItems[i].amount)
                    }
                }
            } else {
                myItems.append(MyItems(id: item.key, amount: item.value))
                saveNewItem(id: item.key, amount: item.value)
            }
        }
    }
    
    func isMapTypeFitsSpecies(species: MySpecies) -> Bool {
        for x in getMap(map: currExploringMap!).type {
            if getSpecies(mySpecies: species).area.contains(where: {$0.key == x.rawValue} ) {
                return true
            }
        }
        
        return false
    }
    
    func typeUp(increase: Bool) -> Double {
        var rate : Double = 1
        
        for type in getMap(map: currExploringMap!).type {
            if getSpecies(mySpecies: currExploringSpecies!).area.keys.contains(type.rawValue) {
                rate += getSpecies(mySpecies: currExploringSpecies!).area[type.rawValue]! - 1
            }
        }
        
        if increase {
            myMaps[getMyMapIndex(map: currExploringMap!)].currTime += Int(Double(selectedTime) * rate)
            myMaps[getMyMapIndex(map: currExploringMap!)].totalTime += Int(Double(selectedTime) * rate)
        }

        
        return rate
    }
    
    func changeToExploringState1() {
        currExploringState = .state1
        UIApplication.shared.isIdleTimerDisabled = false
        currPanelSpecies = mySpecies[0]
        currExploringSpecies = mySpecies[0]
        currExploringMap = myMaps[0]
        isTimerStart.toggle()
        timeRemaining = 30 * 60
        activeAlert = .none
    }
    
    func changeToExploringState2() {
        currExploringState = .state2
        currExploringFixedRewards = [:]
        
        currExploringFixedRewards = getTreasureRewards()
        
        totalExploringTime += selectedTime
        totalTime += selectedTime
        UserDefaults.standard.set(totalExploringTime, forKey: "TotalExploringTime")
        UserDefaults.standard.set(totalTime, forKey: "TotalTime")
        
        _ = typeUp(increase: true)
        
        rewardsAddToBag()
        updateMapData()
        
        if currExploringMap!.currTime + selectedTime >= getMap(map: currExploringMap!).totalTime {
            mapFinished()
        }
        
        let currentDate = Date()
        let logg = FocusLog(date: currentDate, duration: Int(selectedTime/60), action: "exploring")
        focusLog.append(logg)
        currFocusLog = groupAndCalculateDurations()
        DataManager.shared.saveLogData(customItem: logg)
        
        if !myItems.isEmpty {
            currPanelItem = myItems[0]
        }
    }
    
    func saveNewMap(id : Int) {
        DataManager.shared.saveMapData(customItem: MyMaps(id: id, isFinished: false, finishedTimes: 0, currTime: 0, totalTime: 0))
    }
    
    func updateMapData() {
        DataManager.shared.updateMapData(for: currExploringMap?.id ?? 0, with: myMaps[getMyMapIndex(map: currExploringMap!)].currTime, with: myMaps[getMyMapIndex(map: currExploringMap!)].totalTime, with: myMaps[getMyMapIndex(map: currExploringMap!)].finishedTimes , myMaps: myMaps)
    }
    
    func initMyMap() {
        if myMaps.isEmpty {
            myMaps.append(MyMaps(id: 5001, isFinished: true, finishedTimes: 0, currTime: 0, totalTime: 0))
        }
    }
}
