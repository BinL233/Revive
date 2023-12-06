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
            LaunchView()
                .environment(ReviveManager())
                .environment(WidgetManager())
        }
    }
}
