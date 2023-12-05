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
        entity.isFinished = customItem.isFinished
        entity.currTime = Int32(customItem.currTime)
        entity.finishedTimes = Int16(customItem.finishedTimes)
        entity.totalTime = Int32(customItem.totalTime)
        
        do {
            try context.save()
            print("User data:", context, "saved")
        } catch {
            print("Failed to save custom items: \(error)")
        }
    }
    
    func updateMapData(for id: Int, with newCurrTime: Int, with newTotalTime: Int, with newFinishedTimes: Int, myMaps: [MyMaps]) {
        var data = myMaps
        if let index = data.firstIndex(where: { $0.id == id }) {
            data[index].currTime = newCurrTime
            data[index].totalTime = newTotalTime
            data[index].finishedTimes = newFinishedTimes
            
            let context = persistentContainer.viewContext
            let fetchRequest: NSFetchRequest<MapEntity> = MapEntity.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id == %d", id)
            
            do {
                let results = try context.fetch(fetchRequest)
                if let entityToUpdate = results.first {
                    entityToUpdate.currTime = Int32(newCurrTime)
                    entityToUpdate.totalTime = Int32(newTotalTime)
                    entityToUpdate.finishedTimes = Int16(newFinishedTimes)
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
            return entities.map { MyMaps(id: Int($0.id), isFinished: $0.isFinished, finishedTimes: Int($0.finishedTimes), currTime: Int($0.currTime), totalTime: Int($0.totalTime)) }
        } catch {
            print("Failed to fetch custom items: \(error)")
            return []
        }
    }

}
