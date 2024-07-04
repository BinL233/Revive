//
//  ReminderSetting.swift
//  Revive
//
//  Created by Kaile Ying on 11/18/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct ReminderSetting_ios17: View {
    @Environment(ReviveManager_ios17.self) var manager
    @State private var selectedTime = Date()
    @State private var isTimerSelectorShow : Bool = false
    
    var body: some View {
        @Bindable var manager = manager
        Section {
            List {
                HStack {
                    Text("Reminder Notification")
                    Spacer()
                    Toggle("", isOn: $manager.reminderOn)
                        .labelsHidden()
                        .onChange(of: manager.reminderOn) { oldValue, newValue in
                            manager.reminderOn = newValue
                            UserDefaults.standard.set(manager.reminderOn, forKey: "isRemindOn")
                        }
                }
            }
        } header: {
            Text("REMINDER")
        }
    }
}

@available(iOS 16.0, *)
struct ReminderSetting_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    @State private var selectedTime = Date()
    @State private var isTimerSelectorShow : Bool = false
    
    var body: some View {
        Section {
            List {
                HStack {
                    Text("Reminder Notification")
                    Spacer()
                    Toggle("", isOn: $manager.reminderOn)
                        .labelsHidden()
                        .onChange(of: manager.reminderOn) { newValue in
                            manager.reminderOn = newValue
                            UserDefaults.standard.set(manager.reminderOn, forKey: "isRemindOn")
                        }
                }
            }
        } header: {
            Text("REMINDER")
        }
    }
}
