//
//  DataManager.swift
//  Revive
//
//  Created by Kaile Ying on 11/8/23.
//

import Foundation
import CoreData

class DataManager {
    static let shared = DataManager()
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "MySpeciesModel")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data store failed to load with error: \(error)")
            }
        }
    }
    
    func saveData(customItems: [MySpecies]) {
        let context = persistentContainer.viewContext

        for item in customItems {
            let entity = NSEntityDescription.insertNewObject(forEntityName: "SpeciesEntity", into: context) as! SpeciesEntity
            entity.speciesID = Int16(item.speciesID)
            entity.level = Int16(item.level)
            entity.height = item.height
            entity.weight = item.weight
            entity.favorite = item.favorite
        }

        do {
            try context.save()
            print("User data:", context, "saved")
        } catch {
            print("Failed to save custom items: \(error)")
        }
    }

    func loadData() -> [MySpecies] {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<SpeciesEntity>(entityName: "SpeciesEntity")

        do {
            print("Loading user data...")
            let entities = try context.fetch(fetchRequest)
            return entities.map { MySpecies(speciesID: Int($0.speciesID), level: Int($0.level), height: $0.height, weight: $0.weight, favorite: $0.favorite)}
        } catch {
            print("Failed to fetch custom items: \(error)")
            return []
        }
    }
}
