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
                            UserDefaults.standard.set(manager.reminderOn, forKey: "isRemindOn")
                        }
                }
                HStack {
                    Text("Reminder")
                    Spacer()
                    Button {
                        isTimerSelectorShow = true
                    } label: {
                        Text(manager.reminderTime)
                    }
                    .sheet(isPresented: $isTimerSelectorShow) {
                        NavigationStack {
                            DatePicker("Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                                .labelsHidden()
                                .datePickerStyle(WheelDatePickerStyle())
                                .toolbar {
                                    ToolbarItem(placement: .topBarTrailing) {
                                        Button("Confirm") {
                                            isTimerSelectorShow.toggle()
                                            manager.reminderTime = manager.dateToString(date: selectedTime, format: "HH:mm")
                                            UserDefaults.standard.set(manager.reminderTime, forKey: "ReminderTime")
                                            manager.addNotification(title: "Revive Reminder", subtitle: "Let's focus right now!", date: selectedTime)
                                        }
                                    }
                                }
                        }
                    }
                }
            }
        } header: {
            Text("REMINDER")
        }
    }
}
