//
//  ReviveManager+Store.swift
//  Revive
//
//  Created by Kaile Ying on 12/23/23.
//

import Foundation

extension ReviveManager {
    func getCurrStoreItems() -> [StoreItems] {
        var output : [StoreItems] = []
        for _ in 0..<4 {
            var rand = Int.random(in: 1...totalStoreItemsProbability)
            for i in 0..<storeItems.count {
                if rand <= storeItems[i].probability {
                    if output.contains(where: {$0.id == storeItems[i].id}) {
                        continue
                    }
                    
                    output.append(storeItems[i])
                    break
                }
                
                rand -= storeItems[i].probability
            }
        }
        
        return output
    }
    
    func saveStoreItems() {
        UserDefaults.standard.set(currStoreItems[0].id, forKey: "StoreItem1")
        UserDefaults.standard.set(currStoreItems[1].id, forKey: "StoreItem2")
        UserDefaults.standard.set(currStoreItems[2].id, forKey: "StoreItem3")
        UserDefaults.standard.set(currStoreItems[3].id, forKey: "StoreItem4")
    }
    
    func getStoreItem(id: Int) -> StoreItems {
        return storeItems.first(where: { $0.id == id })!
    }
}
