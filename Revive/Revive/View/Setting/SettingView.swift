//
//  SettingView.swift
//  Revive
//
//  Created by Kaile Ying on 11/18/23.
//

import SwiftUI

@available(iOS 17.0, *)
struct SettingView_ios17: View {
    @Environment(ReviveManager_ios17.self) var manager
    
    var body: some View {
        @Bindable var manager = manager
        NavigationStack {
            ZStack {
                Background()
                Form {
                    FocusSetting_ios17()
                    // ReminderSetting()
                    
                    LanguageSetting_ios17()
                    
                    ContactUs()
                    
                    UpdateLogsLink()
                }
                .scrollContentBackground(.hidden)
            }
        }
    }
}

@available(iOS 16.0, *)
struct SettingView_ios16: View {
    @EnvironmentObject var manager: ReviveManager_ios16
    
    var body: some View {
        NavigationStack {
            ZStack {
                Background()
                Form {
                    FocusSetting_ios16()
                    // ReminderSetting()
                    
                    LanguageSetting_ios16()
                    
                    ContactUs()
                    
                    UpdateLogsLink()
                }
                .scrollContentBackground(.hidden)
            }
        }
    }
}
