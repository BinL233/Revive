//
//  DataManager+Statistics.swift
//  Revive
//
//  Created by Kaile Ying on 12/7/23.
//

import Foundation
import CoreData

extension DataManager {
    func saveStaData(customItem: Statistics) {
        let context = persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: "StatisticsEntity", into: context) as! StatisticsEntity
        entity.totalTime = Int32(customItem.totalTime)
        entity.totalHatchingTime = Int32(customItem.totalHatchingTime)
        entity.totalTrainingTime = Int32(customItem.totalTrainingTime)
        entity.totalExploringTime = Int32(customItem.totalExploringTime)
        entity.numOfSpecies = Int32(customItem.numOfSpecies)
        entity.numOfRSpecies = Int32(customItem.numOfRSpecies)
        entity.numOfSRSpecies = Int32(customItem.numOfSRSpecies)
        entity.numOfSSRSpecies = Int32(customItem.numOfSSRSpecies)
        entity.numOfStageTwoSpecies = Int32(customItem.numOfStageTwoSpecies)
        entity.numOfItems = Int32(customItem.numOfItems)
        entity.numOfMap = Int32(customItem.numOfMap)
        entity.numOfFinishedMap = Int32(customItem.numOfFinishedMap)
        entity.numOfCoins = Int64(customItem.numOfCoins)
        entity.currCoins = Int64(customItem.currCoins)
        
        do {
            try context.save()
            print("Statistics data:", context, "saved")
        } catch {
            print("Failed to save custom statistics data: \(error)")
        }
    }
    
    func loadStaData() -> [Statistics] {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<StatisticsEntity>(entityName: "StatisticsEntity")
        
        do {
            print("Loading Statistics data...")
            let entities = try context.fetch(fetchRequest)
            return entities.map { Statistics(totalTime: Int($0.totalTime), totalHatchingTime: Int($0.totalHatchingTime), totalTrainingTime: Int($0.totalTrainingTime), totalExploringTime: Int($0.totalExploringTime), numOfSpecies: Int($0.numOfSpecies), numOfRSpecies: Int($0.numOfRSpecies), numOfSRSpecies: Int($0.numOfSRSpecies), numOfSSRSpecies: Int($0.numOfSSRSpecies), numOfStageTwoSpecies: Int($0.numOfStageTwoSpecies), numOfItems: Int($0.numOfItems), numOfMap: Int($0.numOfMap), numOfFinishedMap: Int($0.numOfFinishedMap), numOfCoins: Int($0.numOfCoins), currCoins: Int($0.currCoins)) }
        } catch {
            print("Failed to fetch custom data: \(error)")
            return []
        }
    }
    
    func deleteSta(sta: Statistics) {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<StatisticsEntity> = StatisticsEntity.fetchRequest()

        do {
            let results = try context.fetch(fetchRequest)
            for entity in results {
                context.delete(entity)
            }
            try context.save()
            print("Successfully deleted all StatisticsEntity records")
        } catch {
            print("Deletion failed: \(error)")
        }
    }
    
//    func updateStaData(with newData: Statistics, sta: [Statistics]) {
//        var data = sta
//        data.totalTime = Int32(newData.totalTime)
//        data.totalHatchingTime = Int32(newData.totalHatchingTime)
//        data.totalTrainingTime = Int32(newData.totalTrainingTime)
//        data.totalExploringTime = Int32(newData.totalExploringTime)
//        data.numOfSpecies = Int32(newData.numOfSpecies)
//        data.numOfRSpecies = Int32(newData.numOfRSpecies)
//        data.numOfSRSpecies = Int32(newData.numOfSRSpecies)
//        data.numOfSSRSpecies = Int32(newData.numOfSSRSpecies)
//        data.numOfStageTwoSpecies = Int32(newData.numOfStageTwoSpecies)
//        data.numOfItems = Int32(newData.numOfItems)
//        data.numOfMap = Int32(newData.numOfMap)
//        data.numOfFinishedMap = Int32(newData.numOfFinishedMap)
//        data.numOfCoins = Int64(newData.numOfCoins)
//        
//        let context = persistentContainer.viewContext
//        let fetchRequest: NSFetchRequest<SpeciesEntity> = SpeciesEntity.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "speciesID == %d", speciesID)
//        
//        do {
//            let results = try context.fetch(fetchRequest)
//            if let entityToUpdate = results.first {
//                entityToUpdate.nickName = newData
//                try context.save()
//                print("Updated Statistics data \(context)")
//            }
//        } catch {
//            print("Statistics data Update failed: \(error)")
//        }
//    }
}
