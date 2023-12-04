//
//  ReviveManager+Items.swift
//  Revive
//
//  Created by Kaile Ying on 12/3/23.
//

import Foundation

extension ReviveManager {
    func updateItemAmount(id: Int, newAmount: Int) {
        DataManager.shared.updateItemCurrTimeData(for: id, with: newAmount, myItems: myItems)
    }
    
    func saveNewItem(id: Int, amount: Int) {
        DataManager.shared.saveItemData(customItem: MyItems(id: id, amount: amount))
    }
    
    func deleteItem(id: Int) {
        DataManager.shared.deleteItemData(for: id)
    }
    
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
                continue
            case "training_time":
                continue
            case "exploring_time":
                continue
            case "rarity_up":
                continue
            case "exp":
                ItemsAddEXP(index: i)
                useItem()
                
            default:
                continue
            }
        }
    }
    
    func useItem() {
        myItems[getMyItemIndex(id: currPanelItem!.id)].amount -= 1
        currPanelItem = myItems[getMyItemIndex(id: currPanelItem!.id)]
        
        updateItemAmount(id: currPanelItem!.id, newAmount: myItems[getMyItemIndex(id: currPanelItem!.id)].amount)
        
        if myItems[getMyItemIndex(id: currPanelItem!.id)].amount == 0 {
            deleteItem(id: currPanelItem!.id)
            myItems.remove(at: getMyItemIndex(id: currPanelItem!.id))
            if myItems.count == 0 {
                currPanelItem = nil
            } else {
                currPanelItem = myItems[0]
            }

        }
    }
    
    func ItemsAddEXP(index: Int) {
        let (levelUpNum, currExp) = getLevelUpNum(species: currPanelSpecies!, exp: Int(getItem(id: currPanelItem!.id).amount[index] ))
        
        mySpecies[getSpeciesIndex(id: currPanelSpecies?.speciesID ?? 0, date: currPanelSpecies?.hatchDate ?? Date())].level += levelUpNum
        mySpecies[getSpeciesIndex(id: currPanelSpecies?.speciesID ?? 0, date: currPanelSpecies?.hatchDate ?? Date())].currExp = currExp
        currPanelSpecies?.level += levelUpNum
        currPanelSpecies?.currExp = currExp
    }
}
