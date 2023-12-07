//
//  DataManager+FocusLog.swift
//  Revive
//
//  Created by Kaile Ying on 11/27/23.
//

import Foundation
import CoreData

extension DataManager {
    func saveLogData(customItem: FocusLog) {
        let context = persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: "FocusEntity", into: context) as! FocusEntity
        entity.date = Date(primitivePlottable: customItem.date)
        entity.duration = Int16(customItem.duration)
        entity.action = customItem.action
        
        do {
            try context.save()
            print("Log data:", context, "saved")
        } catch {
            print("Failed to save custom log: \(error)")
        }
    }
    
    func loadLogData() -> [FocusLog] {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<FocusEntity>(entityName: "FocusEntity")
        
        do {
            let entities = try context.fetch(fetchRequest)
            return entities.map { FocusLog(date: $0.date!, duration: Int($0.duration), action: $0.action ?? "") }
        } catch {
            print("Failed to fetch custom log: \(error)")
            return []
        }
    }

}
