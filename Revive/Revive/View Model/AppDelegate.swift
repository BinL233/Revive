//
//  AppDelegate.swift
//  Revive
//
//  Created by Kaile Ying on 12/6/23.
//

import Foundation
import UIKit
import BackgroundTasks

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        registerBGTaskScheduler()
        return true
    }
    
    func registerBGTaskScheduler() {
        BGTaskScheduler.shared.register(forTaskWithIdentifier: "fun.binltools.Revive.Refresh", using: nil) { task in
            if #available(iOS 17.0, *) {
                ReviveManager_ios17().handleAppRefresh(task: task as! BGAppRefreshTask)
            } else if #available(iOS 16.0, *) {
                ReviveManager_ios16().handleAppRefresh(task: task as! BGAppRefreshTask)
            }
        }
        BGTaskScheduler.shared.register(forTaskWithIdentifier: "fun.binltools.Revive.Processing", using: nil) { task in
            if #available(iOS 17.0, *) {
                ReviveManager_ios17().handleProcessingTask(task: task as! BGProcessingTask)
            } else if #available(iOS 16.0, *) {
                ReviveManager_ios16().handleProcessingTask(task: task as! BGProcessingTask)
            }

        }
        print("Background Tasks Created")
    }
}
