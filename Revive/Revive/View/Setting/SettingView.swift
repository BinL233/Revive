//
//  SettingView.swift
//  Revive
//
//  Created by Kaile Ying on 11/18/23.
//

import SwiftUI

struct SettingView: View {
    @AppStorage("keepDisplay") var keepDisplay : Bool = false
    @AppStorage("reminderOn") var reminderOn : Bool = false
    @AppStorage("reminderTime") var reminderTime : String = "Please select a time"
    
    var body: some View {
        NavigationStack {
            Form {
                FocusSetting(keepDisplay: keepDisplay)
                ReminderSetting(reminderOn: reminderOn, reminderTime: reminderTime)
            }
        }
    }
}

#Preview {
    SettingView()
}
