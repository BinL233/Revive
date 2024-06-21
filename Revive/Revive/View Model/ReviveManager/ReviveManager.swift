//
//  ReviveManager.swift
//  Revive
//
//  Created by Kaile Ying on 11/3/23.
//

import Foundation
import Observation
import CoreData
import SwiftUI
import ActivityKit
import Combine

@Observable
class ReviveManager {
    var focusTimer : AnyCancellable?
    
    // Total list
    var speciesList : [Species]
    var mapList : [ExploringMap]
    var itemList : [Item]
    var animations : Animations
    
    // My species
    var mySpecies : [MySpecies]
    var currHatchingSpecies : Species?
    var currHatchingEgg : Int
    var standardMySpecies : [MySpecies]
    var currPanelSpecies : MySpecies?
    var currTrainingSpecies : MySpecies?
    var currExploringSpecies : MySpecies?
    
    var speciesItemsSelection : SpeciesItems
    
    // Store
    var storeItems : [StoreItems]
    var currStoreItems : [StoreItems]
    var totalStoreItemsProbability : Int
    var currSelectStoreItem : StoreItems?
    var isPurchaseConfirmViewShow: Bool
    var isInsufficientGoldViewShow: Bool
    var storeItem1 : Int
    var storeItem2 : Int
    var storeItem3 : Int
    var storeItem4 : Int
    
    // Map
    var currExploringMap : MyMaps?
    var myMaps : [MyMaps]
    var isTreasureBarCompleted : Bool
    var selectedTime2 : Int
    var isScaledSelectView : Bool
    
    // Item
    var myItems : [MyItems]
    var currPanelItem : MyItems?
    var currExploringItems : [Int:Int]
    var currExploringFixedRewards : [Int:Int]
    var pendingItem : [Int:Int]
    
    // Item Buff
    var isHatchingBuff : Bool
    var hatchingBuffRate : Double
    var isTrainingBuff : Bool
    var trainingBuffRate : Double
    var isExploringBuff : Bool
    var exploringBuffRate : Double
    var isRarityBuff : Bool
    var rarityBuffRate : Double
    
    // Backyard
    var UDSpeciesListSort : String
    var UDItemListSort : String
    var panelInfoAction : PanelButtonsInfoAction
    var isExpItemChooseSpecies : Bool
    var isReleaseConfirm : Bool
    
    // State
    var currHatchingState : CurrHatchingState
    var currTrainingState : CurrTrainingState
    var currExploringState : CurrExploringState
    
    // Actions
    var currAction : CurrAction
    var selectedTime : Int
    var isTimerStart : Bool
    var timeRemaining : TimeInterval
    var activeAlert : ActiveAlert?
    var testMode : TestMode
    var isExpGain : Bool
    var isStartButtonDisabled : Bool
    var isStartButtonDisabled2 : Bool
    var lastBackgroundTime : Date?
    var bgNotification : String?
    var currCoins : Int
    
    // Setting
    var keepDisplay : Bool
    var reminderOn : Bool
    var reminderTime : String
    var backgroundRunning : Bool
    
    // Analysis Details
    var sta : [Statistics]
    
    var focusLog : [FocusLog]
    var currFocusLog : [(key: String, value: Int)]
    var currDistTimeSpanSelection : CurrDistTimeSpanSelection
    var currDistActionSelection : CurrDistActionSelection
    
    init() {
        let localTimeRemaining : TimeInterval = 30 * 60
        let localMySpecies = DataManager.shared.loadData()
        let localFocusLog = DataManager.shared.loadLogData()
        let localMyItems = DataManager.shared.loadItemData()
        let localMyMaps = DataManager.shared.loadMapData()
        var localSta = DataManager.shared.loadStaData()
        let localStoreItems = StoreItems.storeItems ?? []
        
        if localSta.count > 1 {
            for i in 1..<localSta.count {
                DataManager.shared.deleteSta(sta: localSta[i])
            }
            localSta = DataManager.shared.loadStaData()
        }
        
        speciesList = Species.species ?? []
        mapList = ExploringMap.maps ?? []
        itemList = Item.items ?? []
        animations = Animations.animations!
        storeItems = localStoreItems
        
        isScaledSelectView = false
        totalStoreItemsProbability = {
            var prob = 0
            for x in localStoreItems {
                prob += x.probability
            }
            return prob
        }()
        
        mySpecies = localMySpecies.sorted()
        currStoreItems = {
            var output : [StoreItems] = []
            
            if UserDefaults.standard.integer(forKey: "StoreItem1") != 0 {
                output.append(localStoreItems.first(where: { $0.id == UserDefaults.standard.integer(forKey: "StoreItem1") })!)
                output.append(localStoreItems.first(where: { $0.id == UserDefaults.standard.integer(forKey: "StoreItem2") })!)
                output.append(localStoreItems.first(where: { $0.id == UserDefaults.standard.integer(forKey: "StoreItem3") })!)
                output.append(localStoreItems.first(where: { $0.id == UserDefaults.standard.integer(forKey: "StoreItem4") })!)
            }
            
            return output
        }()
        
        myMaps = (localMyMaps.isEmpty) ? [MyMaps(id: 5001, isFinished: false, finishedTimes: 0, currTime: 0, totalTime: 0)] : localMyMaps
        
        if localMyMaps.isEmpty {
            DataManager.shared.saveMapData(customItem: MyMaps(id: 5001, isFinished: false, finishedTimes: 0, currTime: 0, totalTime: 0))
        }
        
        myItems = localMyItems.sorted()
        isExpItemChooseSpecies = false
        lastBackgroundTime = nil
        bgNotification = nil
        
        focusLog = localFocusLog
        selectedTime2 = 0
        sta = localSta.isEmpty ? [Statistics(totalTime: 0, totalHatchingTime: 0, totalTrainingTime: 0, totalExploringTime: 0, numOfSpecies: 0, numOfRSpecies: 0, numOfSRSpecies: 0, numOfSSRSpecies: 0, numOfStageTwoSpecies: 0, numOfItems: 0, numOfMap: 1, numOfFinishedMap: 0, numOfCoins: 0, currCoins: 0, storeLvl: 0)] : localSta
        
        currDistTimeSpanSelection = .week
        currDistActionSelection = .total
        pendingItem = [:]
        isTreasureBarCompleted = false
        panelInfoAction = .none
        isStartButtonDisabled = false
        isStartButtonDisabled2 = false
        currFocusLog = {
            func dateString(from components: DateComponents, calendar: Calendar) -> String {
                if let date = calendar.date(from: components) {
                    return DateFormatter.localizedString(from: date, dateStyle: .medium, timeStyle: .none)
                } else {
                    return "Unknown Date"
                }
            }

            let calendar = Calendar.current
            let groupedLogs = Dictionary(grouping: localFocusLog.filter { log in
                guard let weekAgo = calendar.date(byAdding: .day, value: -7, to: Date()) else { return false }
                return log.date >= weekAgo
            }) { log in
                return calendar.dateComponents([.year, .month, .weekOfYear, .day], from: log.date)
            }

            let durations = groupedLogs.mapValues { logs in
                logs.reduce(0) { $0 + $1.duration }
            }
            
            return durations.map { (key, value) in
                (key: dateString(from: key, calendar: calendar), value: value)
            }.sorted { $0.key < $1.key }
        }()
        
        currExploringItems = [:]
        currExploringFixedRewards = [:]
        currHatchingSpecies = nil
        currAction = .hatching
        currHatchingEgg = 1001
        timeRemaining = localTimeRemaining
        selectedTime = Int(localTimeRemaining)
        isTimerStart = false
        activeAlert = .none
        isHatchingBuff = false
        isTrainingBuff = false
        isExploringBuff = false
        isRarityBuff = false
        hatchingBuffRate = 1
        trainingBuffRate = 1
        exploringBuffRate = 1
        rarityBuffRate = 0
        currHatchingState = .state1
        currTrainingState = .none
        currExploringState = .none
        isReleaseConfirm = false
        testMode = .off
        standardMySpecies = [MySpecies(speciesID: 1, level: 1, currExp: 10, height: 2.2, weight: 3.3, favorite: false, hatchDate: Date(), friendship: 0)]
        currCoins = 0
        currPanelSpecies = localMySpecies.count == 0 ? nil : localMySpecies[0]
        currPanelItem = localMyItems.count == 0 ? nil : localMyItems[0]
        isPurchaseConfirmViewShow = false
        speciesItemsSelection = .Species
        isInsufficientGoldViewShow = false
        currTrainingSpecies = localMySpecies.count == 0 ? nil : localMySpecies[0]
        currExploringSpecies = localMySpecies.count == 0 ? nil : localMySpecies[0]
        currExploringMap = localMyMaps.count == 0 ? MyMaps(id: 5001, isFinished: false, finishedTimes: 0, currTime: 0, totalTime: 0) : localMyMaps[0]
        
        isExpGain = false
        currSelectStoreItem = nil
        keepDisplay = UserDefaults.standard.bool(forKey: "isKeepDisplay")
        reminderOn = UserDefaults.standard.bool(forKey: "isRemindOn")
        reminderTime = UserDefaults.standard.string(forKey: "ReminderTime") ?? "Please select a time"
        UDSpeciesListSort = UserDefaults.standard.string(forKey: "UDSpeciesListSort") ?? "name"
        UDItemListSort = UserDefaults.standard.string(forKey: "UDItemListSort") ?? "name"
        
        if  UserDefaults.standard.object(forKey: "backgroundRunning") == nil {
            backgroundRunning = true
        } else {
            backgroundRunning = UserDefaults.standard.bool(forKey: "backgroundRunning")
        }
        
        storeItem1 = UserDefaults.standard.integer(forKey: "StoreItem1") 
        storeItem2 = UserDefaults.standard.integer(forKey: "StoreItem2")
        storeItem3 = UserDefaults.standard.integer(forKey: "StoreItem3")
        storeItem4 = UserDefaults.standard.integer(forKey: "StoreItem4")
        
        userNotificationCenter()
    }
}
