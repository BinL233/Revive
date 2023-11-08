//
//  ReviveManager+CoreData.swift
//  Revive
//
//  Created by Kaile Ying on 11/8/23.
//

import Foundation
import CoreData

extension ReviveManager {
    func saveData(customItems: [MySpecies]) {
        let context = persistentContainer.viewContext

        for item in customItems {
            let entity = NSEntityDescription.insertNewObject(forEntityName: "mySpecies", into: context) as! SpeciesEntity
            entity.speciesID = Int16(item.speciesID)
            entity.level = Int16(item.level)
            entity.height = item.height
            entity.weight = item.weight
        }

        do {
            try context.save()
        } catch {
            print("Failed to save custom items: \(error)")
        }
    }
    
    func loadData() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "YourEntity")
        do {
            let results = try context.fetch(fetchRequest)
            // 处理结果
        } catch {
            // 处理查询错误
        }
    }
}
