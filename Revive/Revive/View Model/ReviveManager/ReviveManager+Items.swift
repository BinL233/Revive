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
    
    func getItem(id: Int) -> Item {
        return itemList[id - 2001]
    }
    
    
    func itemBuff() {
        for function in getItem(id: currPanelItem!.id).functionType {
            switch function.rawValue {
            case "hatching_time":
                continue
            case "training_time":
                continue
            case "exploring_time":
                continue
            case "rarity_up":
                continue
            case "exp":
                ItemsAddEXP()
            default:
                continue
            }
        }
    }
    
    func ItemsAddEXP() {
        let (levelUpNum, currExp) = getLevelUpNum(species: currPanelSpecies!, exp: currPanelItem?.amount ?? 0)
        
        mySpecies[getSpeciesIndex(id: currPanelSpecies?.speciesID ?? 0, date: currPanelSpecies?.hatchDate ?? Date())].level += levelUpNum
        mySpecies[getSpeciesIndex(id: currPanelSpecies?.speciesID ?? 0, date: currPanelSpecies?.hatchDate ?? Date())].currExp = currExp
        currPanelSpecies?.level += levelUpNum
        currPanelSpecies?.currExp = currExp
    }
}
