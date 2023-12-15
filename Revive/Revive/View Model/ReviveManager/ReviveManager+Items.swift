//
//  ReviveManager+Items.swift
//  Revive
//
//  Created by Kaile Ying on 12/3/23.
//

import Foundation

extension ReviveManager {
    
    func getItem(id: Int) -> Item {
        return itemList[id - 2001]
    }
    
    func getMyItemIndex(id: Int) -> Int {
        for i in 0..<myItems.count {
            if myItems[i].id == id {
                return i
            }
        }
        
        return 0
    }
    
    
    func itemBuff() {
        if currPanelItem == nil {
            return
        }
        
        for i in 0..<getItem(id: currPanelItem!.id).functionType.count {
            switch getItem(id: currPanelItem!.id).functionType[i].rawValue {
            case "hatching_time":
                ItemsforHatchingTime(index: i)
                useItem(save: false, isFeed: false)
            case "training_time":
                ItemsforTrainingTime(index: i)
                useItem(save: false, isFeed: false)
            case "exploring_time":
                ItemsforExploringTime(index: i)
                useItem(save: false, isFeed: false)
            case "rarity_up":
                RarityUp(index: i)
                useItem(save: false, isFeed: false)
            case "exp":
                ItemsAddEXP(index: i)
                useItem(save: true, isFeed: true)
                
            default:
                continue
            }
        }
    }
    
    func updatePendingItem() {
        for item in pendingItem {
            if item.value == 0 {
                deleteItem(id: item.key)
                myItems.remove(at: getMyItemIndex(id: item.key))
            } else {
                updateItemAmount(id: item.key, newAmount: myItems[getMyItemIndex(id: item.value)].amount)
            }
        }
    }
    
    func resetBuffRate() {
        isHatchingBuff = false
        isTrainingBuff = false
        isExploringBuff = false
        isRarityBuff = false
        rarityBuffRate = 0
        hatchingBuffRate = 1
        trainingBuffRate = 1
        exploringBuffRate = 1
    }
    
    func useItem(save: Bool, isFeed: Bool) {
        myItems[getMyItemIndex(id: currPanelItem!.id)].amount -= 1
        currPanelItem = myItems[getMyItemIndex(id: currPanelItem!.id)]
        
        if save {
            updateItemAmount(id: currPanelItem!.id, newAmount: myItems[getMyItemIndex(id: currPanelItem!.id)].amount)
            DataManager.shared.updateMySpeciesCurrExp(for: currPanelSpecies!.speciesID, for: currPanelSpecies!.hatchDate, with: currPanelSpecies!.currExp, mySpecies: mySpecies)
            DataManager.shared.updateMySpeciesLevel(for: currPanelSpecies!.speciesID, for: currPanelSpecies!.hatchDate, with: currPanelSpecies!.level, mySpecies: mySpecies)
            
            if myItems[getMyItemIndex(id: currPanelItem!.id)].amount <= 0 {
                deleteItem(id: currPanelItem!.id)
                myItems.remove(at: getMyItemIndex(id: currPanelItem!.id))
                if myItems.count == 0 || isFeed {
                    currPanelItem = nil
                } else {
                    currPanelItem = myItems[0]
                }

            }
            
        } else {
            pendingItem[currPanelItem!.id] = currPanelItem!.amount
        }
    }
    
    func ItemsAddEXP(index: Int) {
        let (levelUpNum, currExp) = getLevelUpNum(species: currPanelSpecies!, exp: Int(getItem(id: currPanelItem!.id).amount[index] ))
        
        mySpecies[getSpeciesIndex(id: currPanelSpecies?.speciesID ?? 0, date: currPanelSpecies?.hatchDate ?? Date())].level += levelUpNum
        mySpecies[getSpeciesIndex(id: currPanelSpecies?.speciesID ?? 0, date: currPanelSpecies?.hatchDate ?? Date())].currExp = currExp
        currPanelSpecies?.level += levelUpNum
        currPanelSpecies?.currExp = currExp
    }
    
    func ItemsforHatchingTime(index: Int) {
        isHatchingBuff = true
        hatchingBuffRate *= Double(getItem(id: currPanelItem!.id).amount[index])
    }
    
    func ItemsforTrainingTime(index: Int) {
        isTrainingBuff = true
        trainingBuffRate *= Double(getItem(id: currPanelItem!.id).amount[index])
    }
    
    func ItemsforExploringTime(index: Int) {
        isExploringBuff = true
        exploringBuffRate *= Double(getItem(id: currPanelItem!.id).amount[index])
    }
    
    func RarityUp(index: Int) {
        isRarityBuff = true
        rarityBuffRate += Double(getItem(id: currPanelItem!.id).amount[index])
    }
}
