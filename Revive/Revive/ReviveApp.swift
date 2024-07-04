//
//  ReviveApp.swift
//  Revive
//
//  Created by Kaile Ying on 10/3/23.
//

import SwiftUI

@main
struct ReviveApp: App {
    
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            if #available(iOS 17.0, *) {
                LaunchView()
                    .environment(ReviveManager_ios17())
                    .environment(DialogManager_ios17())
            } else if #available(iOS 16.0, *) {
                LaunchView()
                    .environmentObject(ReviveManager_ios16())
                    .environmentObject(DialogManager_ios16())
            }
        }
    }
}
