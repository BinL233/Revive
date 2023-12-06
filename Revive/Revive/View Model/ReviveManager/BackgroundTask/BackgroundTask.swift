//
//  ReviveManager+BackgroundTask.swift
//  Revive
//
//  Created by Kaile Ying on 12/6/23.
//

import Foundation
import BackgroundTasks
import UIKit

extension ReviveManager {
    func registerBGTaskScheduler() {
        BGTaskScheduler.shared.register(forTaskWithIdentifier: "fun.binltools.Revive.Refresh", using: nil) { task in
            self.handleAppRefresh(task: task as! BGAppRefreshTask)
        }
        BGTaskScheduler.shared.register(forTaskWithIdentifier: "fun.binltools.Revive.Processing", using: nil) { task in
            self.handleProcessingTask(task: task as! BGProcessingTask)
        }
        
    }
    
    func scheduleAppRefresh() {
        let request = BGAppRefreshTaskRequest(identifier: "fun.binltools.Revive.Refresh")
        
        // Fetch no earlier than 15 minutes from now.
        //       request.earliestBeginDate = Date(timeIntervalSinceNow: 15 * 60)
        request.earliestBeginDate = Date(timeIntervalSinceNow: 15 * 60)
        
        do {
            try BGTaskScheduler.shared.submit(request)
        } catch {
            print("Could not schedule app refresh: \(error)")
        }
    }
    
    func scheduleProcessing() {
        let request = BGProcessingTaskRequest(identifier: "fun.binltools.Revive.Processing")
        
        // Fetch no earlier than 15 minutes from now.
        //       request.earliestBeginDate = Date(timeIntervalSinceNow: 15 * 60)
        request.earliestBeginDate = Date(timeIntervalSinceNow: 1)
        request.requiresNetworkConnectivity = true
        request.requiresExternalPower = false

        
        do {
            try BGTaskScheduler.shared.submit(request)
        } catch {
            print("Could not schedule processing: \(error)")
        }
    }
    
    func handleProcessingTask(task: BGProcessingTask) {
        // Create an operation that performs the main part of the background task.
        let operation = BackgroundOperation(manager: self)
        
        // Provide the background task with an expiration handler that cancels the operation.
        task.expirationHandler = {
            operation.cancel()
        }
        
        // Inform the system that the background task is complete
        // when the operation completes.
        operation.completionBlock = {
            task.setTaskCompleted(success: !operation.isCancelled)
        }
        
        // Start the operation.
        let queue = OperationQueue()
        
        queue.addOperation(operation)
    }
    
    func handleAppRefresh(task: BGAppRefreshTask) {
        // Schedule a new refresh task.
        scheduleAppRefresh()
        
        // Create an operation that performs the main part of the background task.
        let operation = BackgroundOperation(manager: self)
        
        // Provide the background task with an expiration handler that cancels the operation.
        task.expirationHandler = {
            operation.cancel()
        }
        
        // Inform the system that the background task is complete
        // when the operation completes.
        operation.completionBlock = {
            task.setTaskCompleted(success: !operation.isCancelled)
        }
        
        // Start the operation.
        let queue = OperationQueue()
        
        queue.addOperation(operation)
    }
}
