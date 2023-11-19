//
//  ReviveManager+Notification.swift
//  Revive
//
//  Created by Kaile Ying on 11/18/23.
//

import Foundation
import UserNotifications

extension ReviveManager {
    func userNotificationCenter() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("Notification Configured")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func addNotification(title: String, subtitle: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.sound = UNNotificationSound.default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request)
    }
}
