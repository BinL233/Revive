//
//  DataManager+Item.swift
//  Revive
//
//  Created by Kaile Ying on 11/30/23.
//

import Foundation
import CoreData

extension DataManager {
    func saveItemData(customItem: MyItems) {
        let context = persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: "ItemEntity", into: context) as! ItemEntity
        entity.id = Int16(customItem.id)
        entity.amount = Int32(customItem.amount)
        
        do {
            try context.save()
            print("User data:", context, "saved")
        } catch {
            print("Failed to save custom items: \(error)")
        }
    }
    
    func loadItemData() -> [MyItems] {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ItemEntity>(entityName: "ItemEntity")
        
        do {
            let entities = try context.fetch(fetchRequest)
            return entities.map { MyItems(id: Int($0.id), amount: Int($0.amount)) }
        } catch {
            print("Failed to fetch custom items: \(error)")
            return []
        }
    }

}
