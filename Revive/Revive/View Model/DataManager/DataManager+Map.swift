//
//  DataManager+Map.swift
//  Revive
//
//  Created by Kaile Ying on 11/30/23.
//

import Foundation
import CoreData

extension DataManager {
    func saveMapData(customItem: MyMaps) {
        let context = persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: "MapEntity", into: context) as! MapEntity
        entity.id = Int16(customItem.id)
        entity.isUnlocked = customItem.isUnlocked
        entity.currTime = Int32(customItem.currTime)
        
        do {
            try context.save()
            print("User data:", context, "saved")
        } catch {
            print("Failed to save custom items: \(error)")
        }
    }
    
    func loadMapData() -> [MyMaps] {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<MapEntity>(entityName: "MapEntity")
        
        do {
            let entities = try context.fetch(fetchRequest)
            return entities.map { MyMaps(id: Int($0.id), isUnlocked: $0.isUnlocked, currTime: Int($0.currTime)) }
        } catch {
            print("Failed to fetch custom items: \(error)")
            return []
        }
    }

}
