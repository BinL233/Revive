//
//  ReminderSetting.swift
//  Revive
//
//  Created by Kaile Ying on 11/18/23.
//

import SwiftUI

struct ReminderSetting: View {
    @State var reminderOn : Bool
    @State var reminderTime : String
    @State private var selectedTime = Date()
    @State private var isTimerSelectorShow : Bool = false
    
    var body: some View {
        Section {
            List {
                HStack {
                    Text("Reminder Notification")
                    Spacer()
                    Toggle("", isOn: $reminderOn)
                        .labelsHidden()
                }
                HStack {
                    Text("Reminder")
                    Spacer()
                    Button {
                        isTimerSelectorShow = true
                    } label: {
                        Text(reminderTime)
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
