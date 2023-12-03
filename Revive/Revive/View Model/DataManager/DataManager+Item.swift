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
    
    func updateItemCurrTimeData(for id: Int, with newData: Int, myItems: [MyItems]) {
        var data = myItems
        if let index = data.firstIndex(where: { $0.id == id }) {
            data[index].amount = newData
            
            let context = persistentContainer.viewContext
            let fetchRequest: NSFetchRequest<ItemEntity> = ItemEntity.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id == %d", id)
            
            do {
                let results = try context.fetch(fetchRequest)
                if let entityToUpdate = results.first {
                    entityToUpdate.amount = Int32(newData)
                    try context.save()
                    print("Updated \(context)")
                }
            } catch {
                print("Update failed: \(error)")
            }
        }
    }

}
