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
            var rand = Int.random(in: 1...totalStoreItemsProbility)
            for i in 0..<storeItems.count {
                if rand <= storeItems[i].probility {
                    output.append(storeItems[i])
                    break
                }
                
                rand -= storeItems[i].probility
            }
        }
        
        return output
    }
}
