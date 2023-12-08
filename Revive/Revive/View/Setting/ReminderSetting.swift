//
//  ReminderSetting.swift
//  Revive
//
//  Created by Kaile Ying on 11/18/23.
//

import SwiftUI

struct ReminderSetting: View {
    @Environment(ReviveManager.self) var manager
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
