//
//  ReviveManager+Notification.swift
//  Revive
//
//  Created by Kaile Ying on 11/18/23.
//

import Foundation
import UserNotifications

@available(iOS 17.0, *)
extension ReviveManager_ios17 {
    func userNotificationCenter() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("Notification Configured")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func addNotification(title: String, subtitle: String, date: Date) -> String{
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.sound = UNNotificationSound.default

        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: date)

        let identifier = UUID().uuidString
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
        }
        
        return identifier
    }
}

@available(iOS 16.0, *)
extension ReviveManager_ios16 {
    func userNotificationCenter() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("Notification Configured")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func addNotification(title: String, subtitle: String, date: Date) -> String{
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.sound = UNNotificationSound.default

        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: date)

        let identifier = UUID().uuidString
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
        }
        
        return identifier
    }
}
