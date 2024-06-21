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
    
    let persistentContainer: NSPersistentCloudKitContainer
    
    init() {
        persistentContainer = NSPersistentCloudKitContainer(name: "MySpeciesModel")
        
//        // Local
//        let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//        let localStoreURL = documentsDirectoryURL.appendingPathComponent("LocalStore.sqlite")
//        let localStoreDescription =
//            NSPersistentStoreDescription(url: localStoreURL)
//        localStoreDescription.configuration = "Local"
//
//        // iCloud
//        let iCloudStoreURL = documentsDirectoryURL.appendingPathComponent("iCloudStore.sqlite")
//        let cloudStoreDescription =
//            NSPersistentStoreDescription(url: iCloudStoreURL)
//        cloudStoreDescription.configuration = "Default"
//
//        persistentContainer.persistentStoreDescriptions = [
//            cloudStoreDescription,
//            localStoreDescription
//        ]
//
//        persistentContainer.loadPersistentStores { (storeDescription, error) in
//            if let error = error as NSError? {
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        }

        // iCloud
        
        persistentContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {
                fatalError("Core Data store failed to load with error: \(error)")
            }
        })
        persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
        persistentContainer.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        do {
              try persistentContainer.viewContext.setQueryGenerationFrom(.current)
        } catch {
             fatalError("Failed to pin viewContext to the current generation:\(error)")
        }
    }
    
    func saveData(customItem: MySpecies) {
        let context = persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: "SpeciesEntity", into: context) as! SpeciesEntity
        entity.speciesID = Int16(customItem.speciesID)
        entity.nickName = customItem.nickName
        entity.level = Int16(customItem.level)
        entity.height = customItem.height
        entity.weight = customItem.weight
        entity.favorite = customItem.favorite
        entity.hatchDate = customItem.hatchDate
        entity.currExp = Int32(customItem.currExp)
        entity.friendship = Int16(customItem.friendship)
        
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
            return entities.map { MySpecies(speciesID: Int($0.speciesID), nickName: $0.nickName ?? "", level: Int($0.level), currExp: Int($0.currExp), height: $0.height, weight: $0.weight, favorite: $0.favorite, hatchDate: $0.hatchDate!, friendship: Int($0.friendship)) }
        } catch {
            print("Failed to fetch custom items: \(error)")
            return []
        }
    }
    
    func updateMySpeciesNickName(for speciesID: Int, with newData: String, mySpecies: [MySpecies]) {
        var data = mySpecies
        if let index = data.firstIndex(where: { $0.speciesID == speciesID }) {
            data[index].nickName = newData
            
            let context = persistentContainer.viewContext
            let fetchRequest: NSFetchRequest<SpeciesEntity> = SpeciesEntity.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "speciesID == %d", speciesID)
            
            do {
                let results = try context.fetch(fetchRequest)
                if let entityToUpdate = results.first {
                    entityToUpdate.nickName = newData
                    try context.save()
                    print("Updated \(context)")
                }
            } catch {
                print("Update failed: \(error)")
            }
        }
    }
    
    func updateMySpeciesLevel(for speciesID: Int, for date: Date, with newData: Int, mySpecies: [MySpecies]) {
        var data = mySpecies
        if let index = data.firstIndex(where: { $0.speciesID == speciesID && Calendar.current.isDate($0.hatchDate, equalTo: date, toGranularity: .second) }) {
            data[index].level = newData
            
            let context = persistentContainer.viewContext
            let fetchRequest: NSFetchRequest<SpeciesEntity> = SpeciesEntity.fetchRequest()
            let idPredicate = NSPredicate(format: "speciesID == %d", speciesID)
            let datePredicate = NSPredicate(format: "hatchDate == %@", date as NSDate)
            fetchRequest.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [idPredicate, datePredicate])
            
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
    
    func updateMySpeciesCurrExp(for speciesID: Int, for date: Date, with newData: Int, mySpecies: [MySpecies]) {
        var data = mySpecies
        if let index = data.firstIndex(where: { $0.speciesID == speciesID && Calendar.current.isDate($0.hatchDate, equalTo: date, toGranularity: .second) }) {
            data[index].currExp = newData
            
            let context = persistentContainer.viewContext
            let fetchRequest: NSFetchRequest<SpeciesEntity> = SpeciesEntity.fetchRequest()
            let idPredicate = NSPredicate(format: "speciesID == %d", speciesID)
            let datePredicate = NSPredicate(format: "hatchDate == %@", date as NSDate)
            fetchRequest.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [idPredicate, datePredicate])
            
            do {
                let results = try context.fetch(fetchRequest)
                if let entityToUpdate = results.first {
                    entityToUpdate.currExp = Int32(newData)
                    try context.save()
                    print("Updated \(context)")
                }
            } catch {
                print("Update failed: \(error)")
            }
        }
    }
    
    func updateMySpeciesFriendship(for speciesID: Int, for date: Date, with newData: Int, mySpecies: [MySpecies]) {
        var data = mySpecies
        if let index = data.firstIndex(where: { $0.speciesID == speciesID && Calendar.current.isDate($0.hatchDate, equalTo: date, toGranularity: .second) }) {
            data[index].friendship = newData
            
            let context = persistentContainer.viewContext
            let fetchRequest: NSFetchRequest<SpeciesEntity> = SpeciesEntity.fetchRequest()
            let idPredicate = NSPredicate(format: "speciesID == %d", speciesID)
            let datePredicate = NSPredicate(format: "hatchDate == %@", date as NSDate)
            fetchRequest.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [idPredicate, datePredicate])
            
            do {
                let results = try context.fetch(fetchRequest)
                if let entityToUpdate = results.first {
                    entityToUpdate.friendship = Int16(newData)
                    try context.save()
                    print("Updated \(context)")
                }
            } catch {
                print("Update failed: \(error)")
            }
        }
    }
    
    func updateMySpeciesFavorite(for speciesID: Int, for date: Date, with newData: Bool, mySpecies: [MySpecies]) {
        var data = mySpecies
        if let index = data.firstIndex(where: { $0.speciesID == speciesID && Calendar.current.isDate($0.hatchDate, equalTo: date, toGranularity: .second) }) {
            data[index].favorite = newData
            
            let context = persistentContainer.viewContext
            let fetchRequest: NSFetchRequest<SpeciesEntity> = SpeciesEntity.fetchRequest()
            let idPredicate = NSPredicate(format: "speciesID == %d", speciesID)
            let datePredicate = NSPredicate(format: "hatchDate == %@", date as NSDate)
            fetchRequest.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [idPredicate, datePredicate])
            
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
    
    func deleteMySpecies(for speciesID: Int, for date: Date, mySpecies: [MySpecies]) {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<SpeciesEntity> = SpeciesEntity.fetchRequest()
        
        let idPredicate = NSPredicate(format: "speciesID == %d", speciesID)
        let datePredicate = NSPredicate(format: "hatchDate == %@", date as NSDate)
        fetchRequest.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [idPredicate, datePredicate])
        
        do {
            let results = try context.fetch(fetchRequest)
            for entity in results {
                context.delete(entity)
            }
            try context.save()
            print("Successfully deleted records for speciesID: \(speciesID) and hatchDate: \(date)")
        } catch {
            print("Deletion failed: \(error)")
        }
    }

}
