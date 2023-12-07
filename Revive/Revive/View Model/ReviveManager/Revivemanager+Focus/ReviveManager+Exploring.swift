//
//  ReviveManager+Exploring.swift
//  Revive
//
//  Created by Kaile Ying on 12/2/23.
//

import Foundation
import SwiftUI

extension ReviveManager {
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
        
        sta[0].numOfMap += 1
        sta[0].numOfFinishedMap += 1
        
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
        
        sta[0].numOfItems += Int(selectedTime/60/10)
        deleteStaData()
        saveStaData()
        
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
        
        sta[0].totalExploringTime += selectedTime
        sta[0].totalTime += selectedTime
        
        _ = typeUp(increase: true)
        
        rewardsAddToBag()
        updateMapData()
        updatePendingItem()
        resetBuffRate()
        
        if currExploringMap!.currTime + selectedTime >= getMap(map: currExploringMap!).totalTime {
            mapFinished()
        }
        
        deleteStaData()
        saveStaData()
        
        let currentDate = Date()
        let logg = FocusLog(date: currentDate, duration: Int(selectedTime/60), action: "exploring")
        focusLog.append(logg)
        currFocusLog = groupAndCalculateDurations()
        DataManager.shared.saveLogData(customItem: logg)
        
        if !myItems.isEmpty {
            currPanelItem = myItems[0]
        }
    }
    
    func initMyMap() {
        if myMaps.isEmpty {
            myMaps.append(MyMaps(id: 5001, isFinished: true, finishedTimes: 0, currTime: 0, totalTime: 0))
        }
    }
}
