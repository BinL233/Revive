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
    
    func updateMapCurrTimeData(for id: Int, with newData: Int, myMaps: [MyMaps]) {
        var data = myMaps
        if let index = data.firstIndex(where: { $0.id == id }) {
            data[index].currTime = newData
            
            let context = persistentContainer.viewContext
            let fetchRequest: NSFetchRequest<MapEntity> = MapEntity.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id == %d", id)
            
            do {
                let results = try context.fetch(fetchRequest)
                if let entityToUpdate = results.first {
                    entityToUpdate.currTime = Int32(newData)
                    try context.save()
                    print("Updated \(context)")
                }
            } catch {
                print("Update failed: \(error)")
            }
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
