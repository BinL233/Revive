//
//  DataManager+Collections.swift
//  Revive
//
//  Created by Kaile Ying on 7/12/24.
//

import Foundation
import CoreData

extension DataManager {
    func saveCollectionsSpeciesData(customItem: MyCollectionsSpecies) {
        let context = persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: "CollectionsSpeciesEntity", into: context) as! CollectionsSpeciesEntity
        entity.id = Int16(customItem.id)
        
        do {
            try context.save()
            print("CollectionsSpecies data:", context, "saved")
        } catch {
            print("Failed to save custom items: \(error)")
        }
    }
    
    func loadCollectionsSpeciesData() -> [MyCollectionsSpecies] {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CollectionsSpeciesEntity>(entityName: "CollectionsSpeciesEntity")
        
        do {
            let entities = try context.fetch(fetchRequest)
            return entities.map { MyCollectionsSpecies(id: Int($0.id)) }
        } catch {
            print("Failed to fetch custom items: \(error)")
            return []
        }
    }
}
