//
//  SettingView.swift
//  Revive
//
//  Created by Kaile Ying on 11/18/23.
//

import SwiftUI

struct SettingView: View {
    @Environment(ReviveManager.self) var manager
    
    var body: some View {
        @Bindable var manager = manager
        NavigationStack {
            ZStack {
                Background()
                Form {
                    FocusSetting()
                    ReminderSetting()
                }
                .scrollContentBackground(.hidden)
            }
        }
    }
}
