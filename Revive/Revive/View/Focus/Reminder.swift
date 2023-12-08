//
//  Reminder.swift
//  Revive
//
//  Created by Kaile Ying on 12/7/23.
//

import SwiftUI

struct Reminder: View {
    @Environment(ReviveManager.self) var manager
    @State private var selectedTime = Date()
    @State private var isTimerSelectorShow : Bool = false
    
    var body: some View {
        Button {
            isTimerSelectorShow = true
        } label: {
            Image(systemName: "alarm")
                .font(.title2)
        }
        .sheet(isPresented: $isTimerSelectorShow) {
            NavigationStack {
                VStack {
                    Text("Select remind time")
                        .font(.custom("Georgia-Italic", size: 20))
                        .padding(15)
                        .bold()
                    
                    DatePicker("Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                        .toolbar {
                            ToolbarItem(placement: .topBarTrailing) {
                                Button("Confirm") {
                                    isTimerSelectorShow.toggle()
                                    manager.reminderTime = manager.dateToString(date: selectedTime, format: "HH:mm")
                                    UserDefaults.standard.set(manager.reminderTime, forKey: "ReminderTime")
                                    _ = manager.addNotification(title: "Revive Reminder", subtitle: "Let's focus right now!", date: selectedTime)
                                }
                            }
                        }
                }
            }
        }
    }
}
