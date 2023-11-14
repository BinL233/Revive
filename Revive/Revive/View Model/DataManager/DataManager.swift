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
    
    func saveData(customItem: MySpecies) {
        let context = persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: "SpeciesEntity", into: context) as! SpeciesEntity
        entity.speciesID = Int16(customItem.speciesID)
        entity.level = Int16(customItem.level)
        entity.height = customItem.height
        entity.weight = customItem.weight
        entity.favorite = customItem.favorite
        entity.hatchDate = customItem.hatchDate
        entity.currExp = Int32(customItem.currExp)
        
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
            return entities.map { MySpecies(speciesID: Int($0.speciesID), level: Int($0.level), currExp: Int($0.currExp), height: $0.height, weight: $0.weight, favorite: $0.favorite, hatchDate: $0.hatchDate!)}
        } catch {
            print("Failed to fetch custom items: \(error)")
            return []
        }
    }
    
    func updateMySpeciesLevel(for speciesID: Int, with newData: Int, mySpecies: [MySpecies]) {
        var data = mySpecies
        if let index = data.firstIndex(where: { $0.speciesID == speciesID }) {
            data[index].level = newData
            
            let context = persistentContainer.viewContext
            let fetchRequest: NSFetchRequest<SpeciesEntity> = SpeciesEntity.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "speciesID == %d", speciesID)
            
            do {
                let results = try context.fetch(fetchRequest)
                if let entityToUpdate = results.first {
                    entityToUpdate.level = Int16(newData)
                    try context.save()
                    print("Updated \(context)")
                }
            } catch {
                print("Update failed: \(error)")
            }
        }
    }
    
    func updateMySpeciesFavorite(for speciesID: Int, with newData: Bool, mySpecies: [MySpecies]) {
        var data = mySpecies
        if let index = data.firstIndex(where: { $0.speciesID == speciesID }) {
            data[index].favorite = newData
            
            let context = persistentContainer.viewContext
            let fetchRequest: NSFetchRequest<SpeciesEntity> = SpeciesEntity.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "speciesID == %d", speciesID)
            
            do {
                let results = try context.fetch(fetchRequest)
                if let entityToUpdate = results.first {
                    entityToUpdate.favorite = newData
                    try context.save()
                    print("Updated \(context)")
                }
            } catch {
                print("Update failed: \(error)")
            }
        }
    }
}
